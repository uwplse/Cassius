/*
javascript:void((function(x){x.src = "http://localhost:8000/get_bench.js"; document.querySelector("head").appendChild(x)})(document.createElement("script")));
*/

Props = "width height margin-top margin-right margin-bottom margin-left padding-top padding-right padding-bottom padding-left border-top-width border-right-width border-bottom-width border-left-width float display text-align".split(" ");

Box = function(type, node, props) {
    this.children = [];
    this.type = type; this.props = props; this.node = node;
    return this;
}
function curry(f, arg) { return function(arg1, arg2) { return new f(arg, arg1, arg2) }}
Block = curry(Box, "BLOCK");
Line = curry(Box, "LINE")
Inline = curry(Box, "INLINE")
Page = curry(Box, "PAGE")
Text = curry(Box, "TEXT")
Magic = curry(Box, "MAGIC")
Anon = curry(Box, "ANON")

Box.prototype.toString = function() {
    var s = "[" + this.type;
    for (var i in this.props) {
        val = this.props[i];
        s += " :" + i + " " + (typeof val === "number" ? f2r(val) : val);
    }
    return s + "]";
}

LETTER = window.LETTER || "";
ID = 0;
PADDING = "0000";
function gensym() {
    s = "" + (++ID);
    return "e" + LETTER + PADDING.substring(0, PADDING.length - s.length) + s;
}

APP_PIXEL_TO_PIXELS = 60; // See mozilla/gfx/src/nsCoord.h:18--25 in Firefox source

function f2r(x) {
    if (x == Math.floor(x)) {
        return "" + x;
    } else {
        var xm = Math.round(x * APP_PIXEL_TO_PIXELS);
        var q = APP_PIXEL_TO_PIXELS;
        while (q > 1) {
            var r = xm - Math.floor(xm / q) * q;
            xm = q;
            q = r;
        }
        var num = Math.round(x * APP_PIXEL_TO_PIXELS / xm),
            den = Math.round(APP_PIXEL_TO_PIXELS / xm);
        if (den % 3 == 0) {
            return "(/ " + num + " " + den + ")";
        } else {
            return "" + (num / den);
        }
    }
}

function val2px(val) {
    if (val.endsWith("px")) {
        return +val.substr(0, val.length - 2);
    } else {
        throw "Error, " + val + " is not a pixel quantity."
    }
}

function cs(elt) {
    if (!elt || elt.nodeType !== document.ELEMENT_NODE) console.trace();
    return window.getComputedStyle(elt);
}
function is_text(elt) {return elt.nodeType == document.TEXT_NODE;}
function is_comment(elt) {return elt.nodeType == document.COMMENT_NODE;}
function is_inline(elt) {return cs(elt).display == "inline";}
function is_block(elt) {return cs(elt).display == "block";}
function is_visible(elt) {return cs(elt).display != "none";}

function is_flowroot(elt) {
    // CSS3BOX §4.2
    // Block progression possibilities ignored, because block;-progression assumed to be `tb`
    return cs(elt).float !== "none" || cs(elt).overflow !== "visible" ||
        ["table-cell", "table-caption", "inline-block;", "inline-table"].indexOf(cs(elt).display) !== -1 ||
        ["static", "relative"].indexOf(cs(elt).position) === -1;
}

function get_lines(txt) {
    function find_first_break(txt, loff, roff) {
        if (loff !== loff || roff !== roff) throw "Error";
        if (roff - loff < 2) return roff;
        if (roff - loff == 2) {
            var r2 = new Range();
            r2.setStart(txt, loff);
            r2.setEnd(txt, roff);
            if (r2.getClientRects().length > 1) return loff + 1;
            else return loff + 2;
        }

        mid = Math.round(loff + (roff - loff) / 2);
        var r2 = new Range();
        r2.setStart(txt, loff);
        r2.setEnd(txt, mid);

        if (r2.getClientRects().length > 1) {
            return find_first_break(txt, loff, mid);
        } else {
            return find_first_break(txt, mid - 1, roff);
        }
    }

    var ranges = [];
    var cursor = 0;
    while (cursor < txt.length) {
        var new_cursor = find_first_break(txt, cursor, txt.length);
        var r = new Range();
        r.setStart(txt, cursor);
        r.setEnd(txt, new_cursor);
        ranges.push(r);
        cursor = new_cursor;
    }

    return ranges;
}

function is_text_container(elt) {
    var has_inline = false, has_block = false, has_text = false;
    for (var i = 0; i < elt.childNodes.length; i++) {
        var child = elt.childNodes[i];
        if (is_comment(child)) continue
        else if (is_text(child) && child.textContent.search(/^\s+$/) === -1) has_text = true;
        else if (is_text(child)) continue;
        else if (is_block(child)) has_block = true;
        else if (is_inline(child)) has_inline = true;
        else continue;
    }
    return (has_inline || has_text) && !has_block;
}

function contains_text(elt) {
    var has_inline = false, has_nf_block = false, has_text = false;
    for (var i = 0; i < elt.childNodes.length; i++) {
        var child = elt.childNodes[i];
        if (is_comment(child)) continue
        else if (is_text(child) && child.textContent.search(/^\s+$/) === -1) has_text = true;
        else if (is_text(child)) continue;
        else if (is_inline(child)) has_inline = true;
        else continue;
    }
    return has_inline || has_text;
}

function infer_anons(box, parent) {
    function save_anon_box() {
        if (!anon_box) return;
        var real_anon = Anon(box.node, {});
        infer_lines(anon_box, real_anon);
        parent.children.push(real_anon);
    }
    var anon_box = false;
    for (var i = 0; i < box.children.length; i++) {
        var child = box.children[i];
        if (child.type == "BLOCK" || child.type == "MAGIC") {
            save_anon_box();
            parent.children.push(child);
            anon_box = false;
        } else if (child.type == "ANON") {
            save_anon_box();
            parent.children.push(child);
            anon_box = false;
        } else {
            if (!anon_box) {
                anon_box = new Box("Fake", box.node, {});
            }
            anon_box.children.push(child);
        }
    }
    save_anon_box();
}

function infer_lines(box, parent) {
    function last_line() {
        if (parent.children.length === 0 || parent.children[parent.children.length - 1].type !== "LINE") {
            return null;
        } else {
            return parent.children[parent.children.length - 1];
        }
    }

    function new_line() {
        var l = Line(null, {h: val2px(cs(parent.node)["line-height"])});
        parent.children.push(l);
        return l;
    }

    function fits(txt, line) {
        if (!line) return false;
        var prev = line;
        while (prev.children.length) {
            prev = prev.children[prev.children.length - 1];
        }
        var horiz_adj = (
            txt.props.y + txt.props.h > prev.props.y && prev.props.y >= txt.props.y
            || prev.props.y + prev.props.h > txt.props.y && txt.props.y >= prev.props.y)

        return horiz_adj && txt.props.x >= prev.props.x + prev.props.w;
    }

    var stack = [];
    var sstack = [];
    function go(b) {
        if (b.type == "TEXT") {
            var l = last_line();
            if (!fits(b, l)) {
                l = new_line();
                sstack = [];
            }
            for (var i = 0; i < stack.length; i++) {
                if (!sstack[i]) {
                    var sselt = new Box(stack[i].type, stack[i].props);
                    (i == 0 ? l : sstack[i - 1]).children.push(sselt);
                    sstack.push(sselt);
                }
            }
            (sstack.length === 0 ? l : sstack[sstack.length-1]).children.push(b);
        } else if (b.type == "BLOCK") {
            parent.children.push(b);
        } else if (b.type == "INLINE") {
            stack.push(b);
            for (var i = 0; i < b.children.length; i++) {
                var child = b.children[i];
                go(child);
            }
            stack.pop(b);
            sstack = sstack.slice(0, stack.length);
        } else {
            console.trace();
            console.warn("Unknown box type", b);
        }
    }

    for (var i = 0; i < box.children.length; i++) {
        var child = box.children[i];
        go(child);
    }
}

function make_boxes(elt, inflow, styles) {
    if (is_comment(elt)) {
        return;
    } else if (is_text(elt)) {
        var ranges = get_lines(elt);
        for (var i = 0; i < ranges.length; i++) {
            var r = ranges[i].getClientRects();
            if (r.length > 1) throw "Error, multiple lines in one line: "+ranges[i].toString();
            r = r[0];
            // Whitespace only line
            if (r.width == 0 && r.height == 0) continue;
            var box = Text(elt, {
                x: r.x, y: r.y, w: r.width, h: r.height,
                //text: '"' + ranges[i].toString().replace(/\s+/g, " ") + '"'
            });
            inflow.children.push(box);
        }
    } else if (!is_visible(elt)) {
        return;
    } else if (is_block(elt)) {
        var r = elt.getBoundingClientRect();
        var s = cs(elt);
        var box = Block(elt, {
            tag: elt.tagName,
            x: r.x, y: r.y, w: r.width, h: r.height,
            /*
            mt: val2px(s["margin-top"]), mr: val2px(s["margin-right"]),
            mb: val2px(s["margin-bottom"]), ml: val2px(s["margin-left"]),
            pt: val2px(s["padding-top"]), pr: val2px(s["padding-right"]),
            pb: val2px(s["padding-bottom"]), pl: val2px(s["padding-left"]),
            bt: val2px(s["border-top-width"]), br: val2px(s["border-right-width"]),
            bb: val2px(s["border-bottom-width"]), bl: val2px(s["border-left-width"]),
            */
        });

        if (elt.id) box.props.id = elt.id;
        if (elt.style.length) {
            var eid = gensym();
            if (!elt.id) box.props.id = eid;
            styles[eid] = elt.style;
        }

        inflow.children.push(box);

        if (is_text_container(elt)) {
            // Make a subtree under a fake box
            var fake_parent = new Box("Fake", elt, {});
            for (var i = 0; i < elt.childNodes.length; i++) {
                var child = elt.childNodes[i];
                make_boxes(child, fake_parent, styles);
            }
            // Then break it into lines
            infer_lines(fake_parent, box);
        }  else if (contains_text(elt)) {
            // Make a subtree under a fake box
            var fake_parent = new Box("Fake", elt, {});
            for (var i = 0; i < elt.childNodes.length; i++) {
                var child = elt.childNodes[i];
                make_boxes(child, fake_parent, styles);
            }
            // Then add anonymous boxes
            infer_anons(fake_parent, box);
        }  else {
            for (var i = 0; i < elt.childNodes.length; i++) {
                var child = elt.childNodes[i];
                make_boxes(child, box, styles);
            }
        }
    } else if (is_inline (elt)) {
        var r = elt.getBoundingClientRect();
        var box = Inline(elt, {tag: elt.tagName/*, x: r.x, y: r.y, w: r.width, h: r.height*/});
        if (elt.style.length) {
            var eid = gensym();
            if (!elt.id) box.props.id = eid;
            styles[eid] = elt.style;
        }
        inflow.children.push(box);
        for (var i = 0; i < elt.childNodes.length; i++) {
            var child = elt.childNodes[i];
            make_boxes(child, box, styles);
        }
    } else {
        console.warn("Unclear element-like value, display: " + cs(elt).display, elt.nodeType, elt);
        // Quit iterating downward, who knows what is in this element
        var r = elt.getBoundingClientRect();
        var s = cs(elt);
        var box = Magic(elt, {
            tag: elt.tagName, x: r.x, y: r.y, w: r.width, h: r.height,
            mt: val2px(s["margin-top"]), mr: val2px(s["margin-right"]), 
            mb: val2px(s["margin-bottom"]), ml: val2px(s["margin-left"]),
        });

        if (elt.id) box.props.id = elt.id;

        inflow.children.push(box);
    }
}

function get_boxes() {
    var view = Page(document, {w: window.innerWidth, h: window.innerHeight});
    var style = {};
    make_boxes(document.querySelector("html"), view, style);
    return {view: view, style: style};
}

function page2cassius(name) {
    var out = get_boxes();
    var page = out.view;
    var style = out.style;
    var text = "";
    text += "(define-stylesheet " + name;
    for (var eid in style) {
        if (!style.hasOwnProperty(eid)) continue;
        text += "\n  ((sel/id id/" + eid + ")";
        for (var i = 0; i < style[eid].length; i++) {
            var sname = style[eid][i];
            if (Props.indexOf(sname) === -1) continue;
            var val = style[eid][sname];
            var tname = sname;
            if (tname.startsWith("margin") || tname.startsWith("padding") || tname.startsWith("border")) {
                var tname = tname.split("-", 2)[0];
            }
            if (val.endsWith("px")) {
                val = "(" + tname + "/px " + val2px(val) + ")";
            } else {
                val = tname + "/" + val;
            }
            text += "\n   [" + sname + " " + val + "]";
        }
        text += ")";
    }
    text += ")\n\n";
    text += "(define-document (" + name + " #:width " + page.props.w +  " #:browser firefox)";
    var indent = "  ";

    function recurse(box) {
        text += "\n" + indent + "(" + box.toString();
        var idt = indent;
        indent += " ";
        for (var i = 0; i < box.children.length; i++) recurse(box.children[i]);
        indent = idt;
        text += ")";
    }

    for (var i = 0; i < page.children.length; i++) recurse(page.children[i]);
    text += ")\n\n";

    var title = document.title.replace("\\", "\\\\").replace("\"", "\\\"");
    text += "(define-problem " + name + "\n  \"" + title + "\"\n  #:url \"" + location + "\"\n  #:header header\n  #:sheet " + name  + "\n  #:documents " + name + ")";
    return text;
}

function cassius(name) {
    var pre = document.createElement("pre");
    pre.id = "-x-cassius-output-block";
    pre.innerHTML = page2cassius(name);
    with (pre.style) {
        background = "white", color = "black";
        position = "absolute", top = "0", left = "0";
        zIndex = "1000000";
    }

    var root = document.querySelector("html");
    root.appendChild(pre);

    var r = document.createRange();
    r.selectNodeContents(pre);

    var sel = window.getSelection();
    sel.removeAllRanges();
    sel.addRange(r);
}

cassius("doc-" + LETTER);

function draw_rect(rect) {
    var d = document.createElement("CassiusRect");
    d.style.position = "absolute";
    d.style.top = rect.top + "px";
    d.style.left = rect.left + "px";
    d.style.width = rect.width + "px";
    d.style.height = rect.height + "px";
    d.style.outline = "1px solid red";
    document.querySelector("html").appendChild(d);
}
