/*
javascript:void((function(x){x.src = "http://localhost:8000/get_bench.js"; document.querySelector("head").appendChild(x)})(document.createElement("script")));
*/

Props = "width height margin-top margin-right margin-bottom margin-left padding-top padding-right padding-bottom padding-left border-top-width border-right-width border-bottom-width border-left-width float display text-align".split(" ");
BadProps = "position clear float direction min-height max-height min-width max-width".split(" ");

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

function val2px(val, features) {
    var match;
    if (val == "0") {
        return 0;
    } else if (val.match(/^0[^0-9.]/)) {
        return 0;
    } else if (val.endsWith("px")) {
        return +val.substr(0, val.length - 2);
    } else if (val.endsWith("pt")) {
        return +val.substr(0, val.length - 2)*96/72;
    } else if (val.endsWith("pc")) {
        return +val.substr(0, val.length - 2)*12*96/72;
    } else if (val.endsWith("mm")) {
        return +val.substr(0, val.length - 2)*96/25.4;
    } else if (val.endsWith("cm")) {
        return +val.substr(0, val.length - 2)*96/2.54;
    } else if (val.endsWith("in")) {
        return +val.substr(0, val.length - 2)*96;
    } else if (match = val.match(/^([\d.]+)([^\d.]+)$/)) {
        features[match[2]] = true;
        throw "Error, " + val + " is not a known unit";
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
        // The line-height idea was cute, but doesn't actually work.
        var l = Line(null, {/*h: val2px(cs(parent.node)["line-height"])*/});
        parent.children.push(l);
        return l;
    }

    function fits(txt, line) {
        if (!line) return false;
        var prev = line;
        while (prev.children.length) {
            prev = prev.children[prev.children.length - 1];
        }

        if (prev.type == "INLINE") return true; // HACK for the case of an empty INLINE element
        
        var horiz_adj = (
            txt.props.y + txt.props.h > prev.props.y && prev.props.y >= txt.props.y
            || prev.props.y + prev.props.h > txt.props.y && txt.props.y >= prev.props.y)

        return horiz_adj && txt.props.x >= prev.props.x + prev.props.w;
    }

    function stackup(l, stack, sstack) {
        for (var i = 0; i < stack.length; i++) {
            if (!sstack[i]) {
                var sselt = new Box(stack[i].type, stack[i].node, stack[i].props);
                (i == 0 ? l : sstack[i - 1]).children.push(sselt);
                sstack.push(sselt);
            }
        }
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
            stackup(l, stack, sstack);
            (sstack.length === 0 ? l : sstack[sstack.length-1]).children.push(b);
        } else if (b.type == "BLOCK") {
            parent.children.push(b);
        } else if (b.type == "INLINE") {
            stack.push(b);
            for (var i = 0; i < b.children.length; i++) {
                var child = b.children[i];
                go(child);
            }
            stackup(last_line() || new_line(), stack, sstack);
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

function make_boxes(elt, inflow, styles, features) {
    if (elt.style && elt.style.length) {
        var eid = elt.id || gensym();
        if (!elt.id) elt.id = eid;
        styles[eid] = elt.style;
    }

    if (is_comment(elt)) {
        return;
    } else if (is_text(elt)) {
        var ranges = get_lines(elt);
        for (var i = 0; i < ranges.length; i++) {
            var r = ranges[i].getClientRects();
            if (r.length > 1) throw "Error, multiple lines in one line: "+ranges[i].toString();
            if (r.length < 1) continue;
            r = r[0];
            // Whitespace only line
            if (r.width == 0 || r.height == 0) continue;
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
        if (elt.classList.length) box.props["class"] = "(" + elt.classList + ")";

        inflow.children.push(box);

        if (is_text_container(elt)) {
            // Make a subtree under a fake box
            var fake_parent = new Box("Fake", elt, {});
            for (var i = 0; i < elt.childNodes.length; i++) {
                var child = elt.childNodes[i];
                make_boxes(child, fake_parent, styles, features);
            }
            // Then break it into lines
            infer_lines(fake_parent, box);
        }  else if (contains_text(elt)) {
            // Make a subtree under a fake box
            var fake_parent = new Box("Fake", elt, {});
            for (var i = 0; i < elt.childNodes.length; i++) {
                var child = elt.childNodes[i];
                make_boxes(child, fake_parent, styles, features);
            }
            // Then add anonymous boxes
            infer_anons(fake_parent, box);
        }  else {
            for (var i = 0; i < elt.childNodes.length; i++) {
                var child = elt.childNodes[i];
                make_boxes(child, box, styles, features);
            }
        }
    } else if (is_inline (elt)) {
        var r = elt.getBoundingClientRect();
        var box = Inline(elt, {tag: elt.tagName/*, x: r.x, y: r.y, w: r.width, h: r.height*/});
        if (elt.id) box.props["id"] = elt.id;
        if (elt.classList.length) box.props["class"] = "(" + elt.classList + ")";
        if (elt.style.length) {
            var eid = gensym();
            if (!elt.id) box.props.id = eid;
            styles[eid] = elt.style;
        }
        inflow.children.push(box);
        for (var i = 0; i < elt.childNodes.length; i++) {
            var child = elt.childNodes[i];
            make_boxes(child, box, styles, features);
        }
    } else {
        console.warn("Unclear element-like value, display: " + cs(elt).display, elt.nodeType, elt);

        if (cs(elt).display.startsWith("table")) {
            features["tables"] = true;
        } else if (cs(elt).display == "inline-block") {
            features["inline-block"] = true;
        } else {
            features["unknown-display"] = true;
        }

        // Quit iterating downward, who knows what is in this element
        var r = elt.getBoundingClientRect();
        var s = cs(elt);
        var box = Magic(elt, {
            tag: elt.tagName, x: r.x, y: r.y, w: r.width, h: r.height,
            mt: val2px(s["margin-top"], features), mr: val2px(s["margin-right"], features), 
            mb: val2px(s["margin-bottom"], features), ml: val2px(s["margin-left"], features),
        });

        if (elt.id) box.props.id = elt.id;
        if (elt.classList.length) box.props["class"] = "(" + elt.classList + ")";

        inflow.children.push(box);
    }
}

function get_boxes(features) {
    var has_scrollbar = window.scrollMaxY !== 0;
    var view = Page(document, {w: window.innerWidth - (has_scrollbar ? 13 : 0), h: window.innerHeight});
    var style = {};
    make_boxes(document.querySelector("html"), view, style, features);
    return {view: view, style: style};
}

function dump_selector(sel) {
    var match;
    sel = sel.trim();
    if (sel.indexOf(",") !== -1) {
        var sub = sel.split(",").map(dump_selector);
        if (sub.indexOf(false) !== -1) return false;
        return "(or " + sub.join(" ") + ")";
    } else if (sel.indexOf(" ") !== -1) {
        var sub = sel.split(/\s+/).map(dump_selector);
        if (sub.indexOf(false) !== -1) return false;
        return "(desc " + sub.join(" ") + ")";
    } else if (match = sel.match(/^\.([\w-]+)$/)) {
        return "(class " + match[1] + ")";
    } else if (match = sel.match(/^[\w-]*#([\w-]+)(.[\w-]*)?$/)) {
        return "(id " + match[1].toLowerCase() + ")";
    } else if (match = sel.match(/^([\w-]+)$/)) {
        return "(tag " + match[1].toLowerCase() + ")";
    } else if (match = sel.match(/^\*$/)) {
        return "*";
    } else {
        return false;
    }
}

function rescue_selector(sel) {
    console.log(sel)
    var matched = document.querySelectorAll(sel);
    var ids = [];
    for (var i = 0; i < matched.length; i++) {
        if (matched[i].id) {
            ids.push(matched[i].id);
        } else {
            var id = gensym();
            ids.push(id);
            matched[i].id = id;
        }
    }
    var sel_ = sel.replace("\\", "\\\\").replace("\"", "\\\"");
    return "(\"" + sel_ + "\" (id " + ids.join(") (id ") + "))";
}

function dump_rule(sel, style, features, is_from_style) {
    // Ignore rules that don't match any elements
    if (!document.querySelectorAll(sel).length) return "";

    var text = "";
    var has_good_prop = false;
    for (var i = 0; i < style.length; i++) {
        var sname = style[i];
        if (sname.startsWith("-")) continue; // Skip browser-specific styles for now.
        var val = style[sname];
        if (!val) { console.log(style, i, sname)}
        var tname = sname;
        if (tname.startsWith("margin") || tname.startsWith("padding") || tname.startsWith("border")) {
            var tname = tname.split("-", 2)[0];
        }
        try {
            val = "(px " + f2r(val2px(val, features)) + ")";
        } catch (e) {}

        if (Props.indexOf(sname) === -1) {
            if (BadProps.indexOf(sname) !== -1) {
                text += "\n   #;[" + sname + " " + val + "]";
                features[sname] = true;
            } else {
                //text += "\n   #;[" + sname + " " + val + "]";
            }
        } else {
            has_good_prop = true;
            text += "\n   [" + sname + " " + val + "]";
        }
    }

    if (!has_good_prop) return "";

    var sel_text = dump_selector(sel);
    if (!sel_text) {
        features["unknown-selector"] = true;
        sel_text = rescue_selector(sel);
    }
    return "\n  (" + sel_text + (is_from_style ? " :style" : "") + text + ")";
}

function dump_features(features) {
    var text = "";
    for (var f in features) {
        if (!features.hasOwnProperty(f)) continue;
        text += f + " ";
    }
    return "(" + text.trim() + ")";
}

function page2cassius(name) {
    var features = {};

    var text = "";
    text += "(define-stylesheet " + name;
    for (var sid in document.styleSheets) {
        var ss = document.styleSheets[sid];
        for (var rid in ss.cssRules) {
            if (!ss.cssRules.hasOwnProperty(rid)) continue;
            var r = ss.cssRules[rid];
            if (r.type !== CSSRule.STYLE_RULE) {
                console.warn("Skipping non-style rule", r);
                continue;
            }
            text += dump_rule(r.selectorText, r.style, features);
        }
    }

    var out = get_boxes(features);
    var page = out.view;
    var style = out.style;
    for (var eid in style) {
        if (!style.hasOwnProperty(eid)) continue;
        text += dump_rule("#" + eid, style[eid], features, true);
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
    text += "(define-problem " + name + "\n  \"" + title + "\"\n  #:url \"" + location + "\"\n  #:header header\n  #:sheet " + name  + "\n  #:documents " + name + "\n  #:features " + dump_features(features) + ")";
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
