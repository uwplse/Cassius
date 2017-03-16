/*
javascript:void((function(x){x.src = "http://localhost:8000/get_bench.js"; document.querySelector("head").appendChild(x)})(document.createElement("script")));
*/

Props = "width height margin-top margin-right margin-bottom margin-left padding-top padding-right padding-bottom padding-left border-top-width border-right-width border-bottom-width border-left-width float display text-align border-top-style border-right-style border-bottom-style border-left-style overflow-x overflow-y position top bottom left right box-sizing min-width max-width min-height max-height font-size".split(" ");
BadProps = "clear float direction min-height max-height max-width min-width overflow-x overflow-y position box-sizing white-space content font-size text-indent".split(" ");
BadTags = "img input svg:svg".split(" ");

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

function add_feature(box, feature) {
    var props = box.props["features"] || []
    props.push(feature)
    box.props["features"] = props;
}

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
    } else if (val.match(/^-?0[^0-9.]+/)) {
        return 0;
    } else if (val.match(/^-?[0-9.]+px$/)) {
        return +val.substr(0, val.length - 2);
    } else if (val.match(/^-?[0-9.]+pt$/)) {
        return +val.substr(0, val.length - 2)*96/72;
    } else if (val.match(/^-?[0-9.]+pc$/)) {
        return +val.substr(0, val.length - 2)*12*96/72;
    } else if (val.match(/^-?[0-9.]+mm$/)) {
        return +val.substr(0, val.length - 2)*96/25.4;
    } else if (val.match(/^-?[0-9.]+cm$/)) {
        return +val.substr(0, val.length - 2)*96/2.54;
    } else if (val.match(/^-?[0-9.]+in$/)) {
        return +val.substr(0, val.length - 2)*96;
    } else if (match = val.match(/^([\d.]+)([^\d.]+)$/)) {
        features["unit:" + match[2]] = true;
        throw "Error, " + val + " is not a known unit";
    } else {
        throw "Error, " + val + " is not a pixel quantity."
    }
}

function val2pct(val, features) {
    var match;
    if (val.match(/^-?[0-9.]+%$/)) {
        return +val.substr(0, val.length - 1);
    } else {
        throw "Error, " + val + " is not a percentage quantity."
    }
}

function val2em(val, features) {
    var match;
    if (val.match(/^-?[0-9.]+em$/)) {
        return +val.substr(0, val.length - 2);
    } else if (val.match(/^-?[0-9.]+ex$/)) {
        return +val.substr(0, val.length - 2) / 16 * 9;
    } else {
        throw "Error, " + val + " is not a em quantity."
    }
}

function dump_string(s) {
    return '"' + s.replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '"';
}

function cs(elt) {return window.getComputedStyle(elt);}
function is_text(elt) {return elt.nodeType == document.TEXT_NODE || elt.nodeType == document.CDATA_SECTION_NODE;}
function is_comment(elt) {return elt.nodeType == document.COMMENT_NODE;}
function is_inline(elt) {return cs(elt).display == "inline";}
function is_block(elt) {return cs(elt).display == "block";}
function is_visible(elt) {return cs(elt).display != "none";}
function is_float(elt) {return elt.nodeType === document.ELEMENT_NODE && cs(elt).float != "none";}

function is_flowroot(elt) {
    // CSS3BOX §4.2
    // Block progression possibilities ignored, because block;-progression assumed to be `tb`
    return cs(elt).float !== "none" || cs(elt).overflow !== "visible" ||
        ["table-cell", "table-caption", "inline-block;", "inline-table"].indexOf(cs(elt).display) !== -1 ||
        ["static", "relative"].indexOf(cs(elt).position) === -1;
}

function get_fontsize(elt) {
    var fs = cs(elt.fontSize);
    try { return val2px(fs) } catch (e) {}
    try { return val2pct(fs) * get_fontsize(elt.parentNode) / 100 } catch (e) {}
    try { return val2em(margin) * get_fontsize(elt.parentNode) } catch (e) {}
    throw "Error weird font-size value"
}

function convert_margin(margin, elt) {
    try { return val2px(margin) } catch (e) {}
    try { return val2pct(margin) * elt.clientWidth } catch (e) {}
    try { return val2em(margin) * get_fontsize(elt) } catch (e) {}
    throw "Error weird margin value";
}

function get_margins(elt) {
    return {
        top: convert_margin(cs(elt).marginTop),
        right: convert_margin(cs(elt).marginRight),
        bottom: convert_margin(cs(elt).marginBottom),
        left: convert_margin(cs(elt).marginLeft)
    };
}

function top_outer(elt) {
    return elt.getBoundingClientRect().top - convert_margin(cs(elt).marginTop, elt);
}

function top_content(elt) {
    return elt.getBoundingClientRect().top + elt.clientTop + convert_margin(cs(elt).paddingTop, elt);
}

function right_outer(elt) {
    return elt.getBoundingClientRect().right - convert_margin(cs(elt).marginRight, elt);
}

function right_content(elt) {
    return elt.getBoundingClientRect().left + elt.clientLeft + elt.clientWidth - convert_margin(cs(elt).paddingRight, elt);
}

function bottom_outer(elt) {
    return elt.getBoundingClientRect().bottom + convert_margin(cs(elt).marginBottom, elt);
}

function left_outer(elt) {
    return elt.getBoundingClientRect().left - convert_margin(cs(elt).marginLeft, elt);
}

function left_content(elt) {
    return elt.getBoundingClientRect().left + elt.clientLeft + convert_margin(cs(elt).paddingLeft, elt);
}

function horizontally_adjacent(e1, e2) {
    var b1 = bottom_outer(e1), t1 = top_outer(e1), b2 = bottom_outer(e2), t2 = top_outer(e2);
    if (b1 >= t2 && t2 >= t1 || b2 >= t1 && t1 >= t2) {
        if (t1 == t2 && b1 == b2) {
            return t1 != b2;
        } else {
            return true;
        }
    } else {
        return false;
    }
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
        parent.children.push(anon_box);
    }
    var anon_box = false;
    for (var i = 0; i < box.children.length; i++) {
        var child = box.children[i];
        if (child.type == "BLOCK" || child.type == "MAGIC" || child.type == "ANON") {
            save_anon_box();
            parent.children.push(child);
            anon_box = false;
        } else {
            if (!anon_box) {
                anon_box = new Anon(box.node, {});
            }
            anon_box.children.push(child);
        }
    }
    save_anon_box();

    if (parent.children.length == 1 && parent.children[0].type == "ANON") {
        var anon = parent.children.pop();
        for (var i = 0; i < anon.children.length; i++) {
            parent.children.push(anon.children[i]);
        }
    }
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

        // HACK for the case of an empty INLINE or LINE element
        if (prev.type == "LINE" || prev.type == "INLINE") return true;

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
        } else if (b.type == "BLOCK" || b.type == "MAGIC") {
            parent.children.push(b);
        } else if (b.type == "INLINE" && b.props.br) {
            new_line();
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
            console.warn("Unknown box type", b);
        }
    }

    for (var i = 0; i < box.children.length; i++) {
        var child = box.children[i];
        go(child);
    }
}

function make_boxes(elt, inflow, styles, features) {
    if (BadTags.indexOf(elt.tagName) !== -1) features["tag:" + elt.tagName] = true;

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
                // TODO: Escape correctly
                //text: dump_string(ranges[i].toString().replace(/\s+/g, " "))
            });
            inflow.children.push(box);
        }
    } else if (!is_visible(elt)) {
        return;
    } else if (is_block(elt) && cs(elt)["clear"] === "none") {
        var r = elt.getBoundingClientRect();
        var s = cs(elt);
        var box = Block(elt, {
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

        inflow.children.push(box);

        var fake_lines = new Box("Fake", elt, {});
        var fake_anons = new Box("Fake", elt, {});
        for (var i = 0; i < elt.childNodes.length; i++) {
            var child = elt.childNodes[i];
            make_boxes(child, fake_lines, styles, features);
        }

        // Then break it into lines
        infer_lines(fake_lines, fake_anons);
        // Then add anonymous boxes
        infer_anons(fake_anons, box);
    } else if (is_inline (elt)) {
        var r = elt.getClientRects();
        var box;
        if (r.length == 1 && false) {
            box = Inline(elt, {tag: elt.tagName, x: r[0].x, y: r[0].y, w: r[0].width, h: r[0].height});
        } else {
            box = Inline(elt, {});
        }
        if (elt.tagName.toLowerCase() == "BR") box.props.br = true;
        inflow.children.push(box);
        for (var i = 0; i < elt.childNodes.length; i++) {
            var child = elt.childNodes[i];
            make_boxes(child, box, styles, features);
        }
    } else {
        if (cs(elt).display.startsWith("table")) {
            features["display:table"] = true;
        } else if (cs(elt).display == "inline-block") {
            features["display:inline-block"] = true;
        } else if (cs(elt).display == "list-item") {
            features["display:lists"] = true;
        } else {
            console.warn("Unclear element-like value, display: " + cs(elt).display, elt.nodeType, elt);
            features["display:unknown"] = true;
        }

        // Quit iterating downward, who knows what is in this element
        var r = elt.getBoundingClientRect();
        var s = cs(elt);
        var box = Magic(elt, {
            x: r.x, y: r.y, w: r.width, h: r.height,
            mt: val2px(s["margin-top"], features), mr: val2px(s["margin-right"], features), 
            mb: val2px(s["margin-bottom"], features), ml: val2px(s["margin-left"], features),
        });

        for (var i = 0; i < elt.childNodes.length; i++) {
            var child = elt.childNodes[i];
            make_boxes(child, box, styles, features);
        }

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
    } else if (sel.indexOf(">") !== -1) {
        var sub = sel.split(">").map(dump_selector);
        if (sub.indexOf(false) !== -1) return false;
        return "(child " + sub.join(" ") + ")";
    } else if (sel.indexOf(" ") !== -1) {
        var sub = sel.split(/\s+/).map(dump_selector);
        if (sub.indexOf(false) !== -1) return false;
        return "(desc " + sub.join(" ") + ")";
    } else if (match = sel.match(/^([\w-]+|\*)?((\.|\#)[\w-]+)*$/)) {
        var sub = sel.replace(/\.|\#/g, "\0$&").split("\0");
        if (sub[0] === "") sub.shift();
        sub = sub.map(dump_primitive_selector);
        if (sub.indexOf(false) !== -1) return false;
        return sub.length == 1 ? sub[0] : ("(and " + sub.join(" ") + ")");
    } else {
        return false;
    }
}

function dump_primitive_selector(sel) {
    if (match = sel.match(/^\.([\w-]+)$/)) {
        return "(class " + match[1] + ")";
    } else if (match = sel.match(/^[\w-]*#([\w-]+)(.[\w-]*)?$/)) {
        return "(id " + match[1] + ")";
    } else if (match = sel.match(/^([\w-]+)$/)) {
        return "(tag " + match[1].toLowerCase() + ")";
    } else if (match = sel.match(/^\*$/)) {
        return "*";
    } else {
        return false;
    }
}

function rescue_selector(sel) {
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
    if (ids.length) {
        return "(fake " + dump_string(sel) + " (id " + ids.join(") (id ") + "))";
    } else {
        return "(fake " + dump_string(sel) + ")";
    }
}

function dump_length(val, features) {
    try {
        val = "(px " + f2r(val2px(val, features)) + ")";
    } catch (e) {}
    try {
        val = "(% " + f2r(val2pct(val, features)) + ")";
    } catch (e) {}
    try {
        val = "(em " + f2r(val2em(val, features)) + ")";
    } catch (e) {}
    return val;
}

function dump_rule(sel, style, features, is_from_style) {
    var nodes;
    try {
        nodes = document.querySelectorAll(sel);
    } catch (e) {
        console.warn("Invalid selector syntax, this shouldn't happen:", sel);
        return "";
    }
    var text = "";
    var has_good_prop = false;

    var em2px = null;

    for (var i = 0; i < style.length; i++) {
        var sname = style[i];
        if (sname.startsWith("-")) continue; // Skip browser-specific styles for now.
        var val = style[sname];
        var tname = sname;
        if (val == "inherit") {
            features["css:inherit"] = true;
        }
        if (tname.startsWith("margin") || tname.startsWith("padding") || tname.startsWith("border")) {
            var tname = tname.split("-", 2)[0];
        }

        try {
            val = "(px " + f2r(val2px(val, features)) + ")";
        } catch (e) {}
        try {
            val = "(% " + f2r(val2pct(val, features)) + ")";
        } catch (e) {}
        try {
            val = "(em " + f2r(val2em(val, features)) + ")";
        } catch (e) {}
        
        if (BadProps.indexOf(sname) !== -1) {
            features["css:" + sname] = true;
        }
        
        if (Props.indexOf(sname) !== -1) {
            has_good_prop = true;
            text += "\n   [" + sname + " " + val + "]";
        } else {
            text += "\n   #;[" + sname + " " + val + "]";
        }
    }

    if (!has_good_prop) return "";

    var sels = sel.split(",");
    var out = "";
    for (var i = 0; i < sels.length; i++) {
        var sel_text = dump_selector(sels[i]);
        if (!sel_text) {
            features["unknown-selector"] = true;
            sel_text = rescue_selector(sels[i]);
        }
        out += "\n  (" + sel_text + (is_from_style ? " :style" : "") + text + ")";
    }
    return out;
}

function dump_features(features) {
    var text = "";
    for (var f in features) {
        if (!features.hasOwnProperty(f)) continue;
        text += f + " ";
    }
    return text.trim();
}

function dump_tree(page) {
    var text = "";
    var indent = "  ";

    function recurse(box) {
        if (typeof box === "object") {
            text += "\n" + indent + "(" + box.toString();
            var idt = indent;
            indent += " ";
            for (var i = 0; i < box.children.length; i++) recurse(box.children[i]);
            indent = idt;
            text += ")";
        } else if (typeof box === "string") {
            text += " " + dump_string(box)
        }
    }

    for (var i = 0; i < page.children.length; i++) recurse(page.children[i]);
    return text;
}

function dump_stylesheet(ss, features) {
    var text = "";
    for (var rid in ss.cssRules) {
        if (!ss.cssRules.hasOwnProperty(rid)) continue;
        var r = ss.cssRules[rid];
        try {
            if (r.type === CSSRule.IMPORT_RULE) {
                console.warn("Skipping non-style rule", r);
                continue;
            } else if (r.type === CSSRule.MEDIA_RULE) {
                if (window.matchMedia(r.media).matches) {
                    text += dump_stylesheet(r, features);
                }
            } else if (r.type === CSSRule.STYLE_RULE) {
                text += dump_rule(r.selectorText, r.style, features);
            } else if (  r.type === CSSRule.MOZ_KEYFRAMES_RULE
                     || r.type === CSSRule.MOZ_KEYFRAME_RULE
                     || r.type === CSSRule.FONT_FACE_RULE) {
                // Don't need these...
            } else {
                console.warn("Unknown rule type", r);
            }
        } catch (e) {
            console.warn(r, e);
        }
    }
    return text;
}

function dump_document() {
    var elt = document.documentElement;
    
    function recurse(elt) {
        if (is_comment(elt)) {
            return false;
        } else if (is_text(elt)) {
            if (elt.textContent.search(/^\s+$/) === -1) {
                return elt.textContent;
            } else {
                return false;
            }
        } else if (elt.tagName === "HEAD" || elt.tagName === "SCRIPT") {
            return false;
        } else {
            var rec = new Box(elt.tagName.toLowerCase(), elt, {});
            if (elt.id) rec.props["id"] = elt.id;
            if (elt.classList.length) rec.props["class"] = ("(" + elt.classList + ")").replace(/#/g, "");

            if (elt.tagName === "IMG") {
                rec.props["w"] = elt.naturalWidth;
                rec.props["h"] = elt.naturalHeight;
            }

            if (elt.tagName === "INPUT") {
                rec.props["w"] = elt.getBoundingClientRect().width;
                rec.props["h"] = elt.getBoundingClientRect().height;
            }
            
            for (var i = 0; i < elt.childNodes.length; i++) {
                if (is_comment(elt.childNodes[i])) continue;
                var b = recurse(elt.childNodes[i]);
                if (b) rec.children.push(b);
            }
            return rec;
        }
    }

    var s = recurse(elt);
    var b = new Box("document", document, {});
    b.children.push(s);
    return b;
}

MAX_LEFT = 0;
MAX_RIGHT = 0;
MAX_TOTAL = 0;

function Ezone() {
    this.left = [];
    this.right = [];
    this.mark = 0;
    this.prev = null;
    return this;
}

Ezone.prototype.add = function(box) {
    var dir = cs(box).float;
    var steps = this[dir];
    var x = (dir == "left" ? right_outer : left_outer)(box);
    var y = bottom_outer(box);
    var mark = top_outer(box);
    for (var i = 0; i < steps.length; i++) {
        if (!steps[i]) continue;
        if (bottom_outer(steps[i]) < mark) {
            steps[i] = null;
            continue;
        }
        if (cs(steps[i]).float == "left" && bottom_outer(steps[i]) <= y && right_outer(steps[i]) <= x
            || cs(steps[i]).float == "right" && bottom_outer(steps[i]) <= y && left_outer(steps[i]) <= x) {
            steps[i] = null;
            continue;
        }
    }
    var i = 0;
    while (i < steps.length) {
        if (steps[i]) i++
        else steps.splice(i, 1);
    }
    steps.push(box);
    this.mark = Math.max(this.mark, mark);
    this.prev = box;

    MAX_LEFT = Math.max(this.left.length, MAX_LEFT);
    MAX_RIGHT = Math.max(this.right.length, MAX_RIGHT);
    MAX_TOTAL = Math.max(this.left.length + this.right.length, MAX_TOTAL);
}

Ezone.prototype.clone = function() {
    var x = new Ezone();
    x.left = this.left.slice();
    x.right = this.right.slice();
    x.mark = this.mark;
    x.prev = this.prev;
    return x;
}

function compute_flt_pointer(box, prev, vbox) {
    box.flt = prev || new Ezone();
    box.vbox = vbox;
    if (box.node && is_float(box.node)) {
        prev = null;
        vbox = null;
        for (var i = 0; i < box.children.length; i++) {
            prev = compute_flt_pointer(box.children[i], prev, vbox);
            vbox = box;
        }
        var out = box.flt.clone();
        out.add(box.node);
        return out;
    } else {
        vbox = null;
        for (var i = 0; i < box.children.length; i++) {
            prev = compute_flt_pointer(box.children[i], prev, vbox);
            vbox = box;
        }
        return prev;
    }
}

function check_float_restrictions(box, parent, features) {
    if (!features) { features = parent; parent = null };

    if (parent && box.node && is_float(box.node)) {
        var flt = box.flt.prev ? box.flt.prev : null;

        // R1: No negative margins on floats; otherwise they can overlap
        if (bottom_outer(box.node) <= top_outer(box.node)
            && left_outer(box.node) != right_outer(box.node)) {
            features["float:R1"] = true;
            add_feature(box, "float:R1")
        }

        // R2: The bottom of a box is farther down than the bottom of the previous box
        if (flt) {
            if (bottom_outer(box.node) < bottom_outer(flt)) {
                features["float:R2"] = true;
                add_feature(box, "float:R2");
            }
        }

        // R3: If a float wraps to the next line, the previous line must be full
        if (flt && top_outer(box.node) == bottom_outer(flt)
            && top_outer(box.node) !== (!box.vbox ? top_content(parent.node) : bottom_outer(box.vbox.node))) {
            // TODO: Assumes no padding!
            if ((cs(box.node).float == "left") ? 
                (right_outer(flt) < right_content(parent.node)) : 
                (left_outer(flt) > left_content(parent.node))
                ) {
                features["float:R3"] = true;
                add_feature(box, "float:R3");
            }
        }

        // R4: If this and the previous float float to different
        // sides, they are not horizontally adjacent
        if (flt && cs(box.node).float != cs(flt).float) {
            if (horizontally_adjacent(flt, box.node)) {
                features["float:R4"] = true;
                add_feature(box, "float:R4");
            }
        }
    } else if (box.type === "TEXT") {
        if (box.props.y < box.flt.mark) {
            console.log(box.props.y, box.flt);
            add_feature(box, "exclusion-zone");
            features["exclusion-zone"] = true;
        }
    }

    for (var i = 0; i < box.children.length; i++) {
        check_float_restrictions(box.children[i], box, features);
    }
}

function page2cassius(name) {
    var features = {};

    var text = "";
    text += "(define-stylesheet " + name;
    for (var sid in document.styleSheets) {
        text += dump_stylesheet(document.styleSheets[sid], features);
    }

    var out = get_boxes(features);
    var page = out.view;
    
    compute_flt_pointer(page, null);
    check_float_restrictions(page, features);

    var style = out.style;
    for (var eid in style) {
        if (!style.hasOwnProperty(eid)) continue;
        text += dump_rule("#" + eid, style[eid], features, true);
    }
    text += ")\n\n";
    text += "(define-layout (" + name + " :browser firefox)\n ([VIEW :w " + page.props.w + "]";
    text += dump_tree(page);
    text += "))\n\n";
    text += "(define-document " + name;
    text += dump_tree(dump_document());
    text += ")\n\n";

    var title = dump_string(document.title);
    text += "(define-problem " + name + "\n  :title " + title + "\n  :url \"" + location + "\"\n  :sheets " + name  + "\n  :documents " + name + "\n  :layouts " + name + "\n  :features " + dump_features(features) + "\n  :max " + MAX_TOTAL + " " + MAX_LEFT + " " + MAX_RIGHT + ")";
    return text;
}

function cassius(name) {
    var pre = document.createElement("pre");
    pre.id = "-x-cassius-output-block";
    pre.innerText = page2cassius(name);
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
