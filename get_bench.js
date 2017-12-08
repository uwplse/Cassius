/*
javascript:void((function(x){x.src = "http://localhost:8000/get_bench.js"; document.querySelector("head").appendChild(x)})(document.createElement("script")));
*/

Props = "width height margin-top margin-right margin-bottom margin-left padding-top padding-right padding-bottom padding-left border-top-width border-right-width border-bottom-width border-left-width float display text-align border-top-style border-right-style border-bottom-style border-left-style overflow-x overflow-y position top bottom left right box-sizing min-width max-width min-height max-height font-size font-family font-style font-weight text-indent clear color background-color line-height vertical-align".split(" ");
BadProps = "clear float direction min-height max-height max-width min-width overflow-x overflow-y position box-sizing white-space font-size text-indent vertical-align".split(" ");
BadTags = "img iframe input svg:svg button frame noframes".split(" ");

var FontIDMap = Object();
var nextID = 0;

function get_font_ID(style) {
	var font = [style.fontSize, style.fontFamily, style.fontWeight, style.fontStyle].join(" ");
	if (!FontIDMap.hasOwnProperty(font)) {
		var id = nextID++;
		FontIDMap[font] = id;
		return id;
	} else {
		return FontIDMap[font];
	}
}

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

ERROR = false;

LETTER = window.LETTER || "";
ID = 0;
PADDING = "0000";
function gensym() {
    s = "" + (++ID);
    return "e" + LETTER + PADDING.substring(0, PADDING.length - s.length) + s;
}

APP_PIXEL_TO_PIXELS = 60; // See mozilla/gfx/src/nsCoord.h:18--25 in Firefox source
DIVISORS = [];

for (var i = 1; i * i < APP_PIXEL_TO_PIXELS; i++) {
    if (APP_PIXEL_TO_PIXELS % i == 0) {
        DIVISORS.push(i);
        DIVISORS.push(APP_PIXEL_TO_PIXELS / i);
    }
}

DIVISORS.sort(function(a, b) { return a - b; });
DIVISORS.reverse();

function f2r(x) {
    var out = f2q(x);
    if (out.denom == 1) {
        return "" + out.num;
    } else if (out.denom == 2 || out.denom == 5 || out.denom == 10) {
        return "" + (out.num / out.denom);
    } else {
        return "(/ " + out.num + " " + out.denom + ")";
    }
}

function f2q(x) {
    var xm = Math.round(x * APP_PIXEL_TO_PIXELS);
        
    for (var i = 0; i < DIVISORS.length; i++) {
        var div = DIVISORS[i];
        if (xm % div == 0) {
            return { num: xm / div, denom: APP_PIXEL_TO_PIXELS / div };
        }
    }
}

function val2px(val, features) {
    var match;
    if (val == "0") {
        return 0;
    } else if (val.match(/^-?0[^0-9.]+/)) {
        return 0;
    } else if (val.match(/^[-+0-9.e]+px$/)) {
        return +val.substr(0, val.length - 2);
    } else if (val.match(/^[-+0-9.e]+pt$/)) {
        return +val.substr(0, val.length - 2)*96/72;
    } else if (val.match(/^[-+0-9.e]+pc$/)) {
        return +val.substr(0, val.length - 2)*12*96/72;
    } else if (val.match(/^[-+0-9.e]+mm$/)) {
        return +val.substr(0, val.length - 2)*96/25.4;
    } else if (val.match(/^[-+0-9.e]+cm$/)) {
        return +val.substr(0, val.length - 2)*96/2.54;
    } else if (val.match(/^[-+0-9.e]+in$/)) {
        return +val.substr(0, val.length - 2)*96;
    } else if (match = val.match(/^([-+0-9.e]+)([a-z]+)$/)) {
        features["unit:" + match[2]] = true;
        throw "Error, " + val + " is not a known unit";
    } else {
        throw "Error, " + val + " is not a pixel quantity."
    }
}

function val2pct(val, features) {
    var match;
    if (val.match(/^[-+0-9.e]+%$/)) {
        return +val.substr(0, val.length - 1);
    } else {
        throw "Error, " + val + " is not a percentage quantity."
    }
}

function val2em(val, features) {
    var match;
    if (val.match(/^[-+0-9.e]+em$/)) {
        return +val.substr(0, val.length - 2);
    } else if (val.match(/^-?[-+0-9.e]+ex$/)) {
        features["unit:ex"] = true;
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
function is_iblock(elt) {return cs(elt).display == "inline-block";}
function is_block(elt) {
    return cs(elt).display == "block" ||
        (cs(elt).display == "list-item" &&
         (cs(elt).listStylePosition == "outside" ||
          cs(elt).listStyleType == "none"));
}
function is_visible(elt) {return cs(elt).display != "none";}
function is_float(elt) {return elt.nodeType === document.ELEMENT_NODE && cs(elt).float != "none";}

function is_flow_block(elt) {
    return elt.nodeType == document.ELEMENT_NODE &&
        cs(elt).float === "none" && ["static", "relative"].indexOf(cs(elt).position) !== -1;
}

function is_flowroot(elt) {
    // CSS3BOX §4.2
    // Block progression possibilities ignored, because block;-progression assumed to be `tb`
    return elt.nodeType == document.ELEMENT_NODE &&
        (cs(elt).float !== "none" || cs(elt).overflow !== "visible" ||
         ["table-cell", "table-caption", "inline-block;", "inline-table"].indexOf(cs(elt).display) !== -1 ||
         ["static", "relative"].indexOf(cs(elt).position) === -1);
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

function convert_offset(offset, elt) {
    if (offset == "auto") {
        return false;
    } else if (offset.match(/%$/)) {
        return val2pct(offset) * elt.parentNode.clientHeight;
    } else {
        return val2px(offset);
    }
    throw "Error weird offset value";
}

function get_margins(elt) {
    return {
        top: convert_margin(cs(elt).marginTop, elt),
        right: convert_margin(cs(elt).marginRight, elt),
        bottom: convert_margin(cs(elt).marginBottom, elt),
        left: convert_margin(cs(elt).marginLeft, elt)
    };
}

function get_relative_offset(elt) {
    return {
        top: convert_offset(cs(elt).top, elt),
        bottom: convert_offset(cs(elt).bottom, elt),
    }
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

function get_lines(txt) {
    var ranges = [];
    var cursor = 0;
    var r =  new Range();
    r.selectNode(txt);
    if (r.getClientRects().length == 0) return ranges;

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

function infer_anons(inputs) {
    var estack = [inputs];
    var out = [];
    var bstack = [out];
    var block_mode = true;

    function reenter() {
        var b = Anon();
        bstack[0].push(b)
        bstack.push(b.children);

        for (var i = 0; i < estack.length - 1; i++) {
            var b = Inline(estack[i][0].node, estack[i][0].props);
            bstack[bstack.length - 1].push(b)
            bstack.push(b.children);
        }

        block_mode = false;
    }

    while (estack[0].length > 0) {
        if (estack[estack.length - 1].length > 0) {
            var e = estack[estack.length - 1][0];
            if (e.type == "TEXT") {
                if (block_mode) reenter(estack);
                bstack[bstack.length - 1].push(e);
                estack[estack.length - 1].shift();
            } else if (e.type == "INLINE" && cs(e.node).display == "inline-block") {
                if (block_mode) reenter(estack);
                bstack[bstack.length - 1].push(e);
                estack[estack.length - 1].shift();
            } else if (e.type == "INLINE") {
                if (block_mode) reenter(estack);
                var b = Inline(e.node, e.props);
                bstack[bstack.length - 1].push(b);
                bstack.push(b.children);
                estack.push(e.children);
            } else if ((e.type == "BLOCK" || e.type == "MAGIC") && is_flow_block(e.node)) {
                bstack[0].push(e);
                estack[estack.length - 1].shift();
                bstack = [bstack[0]];
                block_mode = true;
            } else if ((e.type == "BLOCK" || e.type == "MAGIC")) {
                bstack[bstack.length - 1].push(e);
                estack[estack.length - 1].shift();
            } else {
                throw "What happened? " + e;
            }
        } else {
            if (!block_mode) bstack.pop();
            estack.pop();
            estack[estack.length - 1].shift();
        }
    }

    return out;
}

function has_positions(b) {
    return typeof b.props.w === "number" && typeof b.props.h === "number" &&
        typeof b.props.x === "number" && typeof b.props.y === "number";
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
        last = false;
        return l;
    }

    function fits(txt, prev) {
        /*
        if (!line) return false;
        var prev = line;
        while (prev.children.length) {
            prev = prev.children[prev.children.length - 1];
        }

        // HACK for the case of an empty INLINE or LINE element
        if (prev.type == "LINE" || prev.type == "INLINE") return true;
        */
        if (!prev) return true;
        var ph = prev.props.h;
        var py = prev.props.y;
        if (prev.type == "INLINE" && has_positions(prev)) {
            var m = get_margins(prev.node);
            ph += m.top + m.bottom;
            py -= m.top;
            var pos = get_relative_offset(prev.node);
            if (pos.top) py -= pos.top;
            else if (pos.bottom) py += pos.bottom;
        }

        var th = txt.props.h;
        var ty = txt.props.y;
        if (txt.type == "INLINE" && has_positions(prev)) {
            var m = get_margins(txt.node);
            th += m.top + m.bottom;
            ty -= m.top;
            var pos = get_relative_offset(txt.node);
            if (pos.top) ty -= pos.top;
            else if (pos.bottom) ty += pos.bottom;
        }

        var horiz_adj = (ty + th >= py && py >= ty || py + ph >= ty && ty >= py)

        // Note fuzziness
        return horiz_adj && txt.props.x >= prev.props.x + prev.props.w - 1/APP_PIXEL_TO_PIXELS;
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
    var last = false;
    function go(b) {
        if (b.type == "TEXT" || b.type == "BLOCK" || b.type == "MAGIC" ||
            (b.type == "INLINE" && has_positions(b))) {
            // TODO: does not handle case where previous elt is floating BLOCK
            var l = last_line() || new_line();
            if (b.type !== "BLOCK" && !fits(b, last)) {
                l = new_line();
                sstack = [];
            }
            stackup(l, stack, sstack);
            (sstack.length === 0 ? l : sstack[sstack.length-1]).children.push(b);
            if (b.type !== "BLOCK") last = b;
        } else if (b.type == "INLINE") {
            stack.push(b);
            for (var i = 0; i < b.children.length; i++) {
                var child = b.children[i];
                go(child);
            }
            stackup(last_line() || new_line(), stack, sstack);
            stack.pop(b);
            sstack = sstack.slice(0, stack.length);
            if (b.node && b.node.tagName.toUpperCase() == "BR") {
                new_line();
                sstack = [];
            }
        } else {
            console.warn("Unknown box type", b);
            window.ERROR = "Unknown box type: " + b;
        }
    }

    for (var i = 0; i < box.children.length; i++) {
        var child = box.children[i];
        go(child);
    }
}

function extract_text(elt) {
    var outs = [];
    var ranges = get_lines(elt);
    for (var i = 0; i < ranges.length; i++) {
        var r = ranges[i].getClientRects();
        if (r.length > 1) throw "Error, multiple lines in one line: "+ranges[i].toString();
        if (r.length < 1) continue;
        r = r[0];
        var box = Text(elt, {x: r.x, y: r.y, w: r.width, h: r.height});
        box.props.text = dump_string(ranges[i].toString().replace(/\s+/g, " "));
        outs.push(box);
    }
    return outs;
}

function extract_block(elt, children) {
    var r = elt.getBoundingClientRect();
    var s = cs(elt);

    children = infer_anons(children);
    for (var i = 0; i < children.length; i++) {
        if (children[i].type == "ANON") {
            var b = children[i];
            var b2 = Anon(b.node, b.props);
            infer_lines(b, b2);
            children[i] = b2;
        }
    }

    if (children.length == 1 && children[0].type == "ANON") {
        children = children[0].children;
    }

    var box = Block(elt, {x: r.x, y: r.y, w: r.width, h: r.height});
    box.children = children;

    if (cs(elt).display == "list-item" && children.length == 0) {
        children.push(Line(null, {}));
    }

    return box;
}

function extract_inline(elt, children) {
    var r = elt.getClientRects();
    var box;
    if (r.length == 1 && is_replaced(elt)) { // TODO: enable in all cases
        box = Inline(elt, {x: r[0].x, y: r[0].y, w: r[0].width, h: r[0].height});
    } else {
        box = Inline(elt, {});
    }
    box.children = children;
    return box;
}

function extract_magic(elt, children) {
    var r = elt.getBoundingClientRect();
    var s = cs(elt);
    var box = Magic(elt, {
        x: r.x, y: r.y, w: r.width, h: r.height
    });

    box.children = children;

    return box;
}

function make_boxes(elt, styles, features) {
    if (elt.tagName && BadTags.indexOf(elt.tagName.toLowerCase()) !== -1) {
        features["tag:" + elt.tagName.toLowerCase()] = true;
    }

    if (elt.style && elt.style.length) {
        var eid = elt.id || gensym();
        if (!elt.id) elt.id = eid;
        styles[eid] = elt.style;
    }

    if (elt.nodeType !== document.ELEMENT_NODE) {
        // ok
    } else if (["none", "inline", "block"].indexOf(cs(elt).display) !== -1) {
        // ok
    } else if (cs(elt).display.startsWith("table")) {
        features["display:table"] = true;
    } else if (cs(elt).display == "inline-block") {
        features["display:inline-block"] = true;
    } else if (cs(elt).display == "list-item") {
        features["display:list-item"] = true;
    } else {
        console.warn("Unclear element-like value, display: " + cs(elt).display, elt.nodeType, elt);
        features["display:unknown"] = true;
    }

    if (elt.nodeType == document.ELEMENT_NODE &&
        cs(elt).display == "list-item" && cs(elt).listStylePosition == "inside" && cs(elt).listStyleType != "none") {
        features["list:inside"] = true;
    }

    var children = [];
    for (var i = 0; i < elt.childNodes.length; i++) {
        children = children.concat(make_boxes(elt.childNodes[i], styles, features));
    }

    if (is_comment(elt)) {
        return [];
    } else if (is_text(elt)) {
        var out = extract_text(elt);
        var out2 = out.filter(function(x) {return x.props.w !== 0 || x.props.h !== 0});
        if (out.length !== out2.length) features["empty-text"] = true;
        return out2;
    } else if (!is_visible(elt)) {
        return [];
    } else if ((is_block(elt) || is_iblock(elt))) {
        var box = extract_block(elt, children);
        if (is_iblock(elt)) box.type = "INLINE";
        return [box];
    } else if (is_inline(elt)) {
        return [extract_inline(elt, children)];
    } else {
        return [extract_magic(elt, children)];
    }
}

// Inspired by https://stackoverflow.com/questions/13382516/getting-scroll-bar-width-using-javascript
function compute_scrollbar_width() {
    var outer = document.createElement("CassiusBlock");
    var inner = document.createElement("CassiusBlock");
    outer.style.display = "block";
    outer.style.overflow = "scroll";
    outer.style.borderLeftStyle = "none";
    outer.style.borderRightStyle = "none";
    outer.style.position = "absolute";
    outer.appendChild(inner);
    document.body.appendChild(outer);
    var out = outer.offsetWidth - outer.clientWidth;
    document.body.removeChild(outer)
    return out;
}

function get_boxes(features) {
    window.scrollTo(0, 0);
    var view = Page(document, {w: window.innerWidth, h: window.innerHeight});
    var style = {};
    view.children = make_boxes(document.documentElement, style, features);
    if (window.scrollMaxY !== 0) {
        view.props.w -= compute_scrollbar_width();
        features["scrollbar"] = true;
    }
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
        var sub = sel.split(" ");
        // This one is complicated
        var in_desc = true;
        var previous = [dump_selector(sub[0])];
        if (!previous[0]) return false;
        for (var i = 1; i < sub.length; i++) {
            if (sub[i] == "") continue;
            if (sub[i] == ">") {
                i++;
                var next = dump_selector(sub[i]);
                if (!next) return false;
                if (in_desc && previous.length > 1) {
                    previous = ["(desc " + previous.join(" ") + ")"];
                }
                previous.push(next);
                in_desc = false;
            } else {
                var next = dump_selector(sub[i]);
                if (!next) return false;
                if (!in_desc && previous.length > 1) {
                    previous = ["(child " + previous.join(" ") + ")"];
                }
                previous.push(next);
                in_desc = true;
            }
        }
        if (previous.length > 1) {
            return "(" + (in_desc ? "desc" : "child") + " " + previous.join(" ") + ")";
        } else {
            return previous[0];
        }
    } else if (sel.indexOf(" ") !== -1) {
        var sub = sel.split(/\s+/).map(dump_selector);
        if (sub.indexOf(false) !== -1) return false;
        return "(desc " + sub.join(" ") + ")";
    } else if (match = sel.match(/^([\w-]+|\*)?((::?|\.|\#)[\w-]+|\[type=\"[\w-]+\"\])*$/)) {
        var sub = sel.replace(/\[|\.|\#|::?/g, "\0$&").split("\0");
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
    } else if (match = sel.match(/^:([\w-]+)$/)) {
        if (["first-child", "last-child", "hover"].indexOf(match[1]) !== -1) {
            return "(pseudo-class " + match[1] + ")";
        } else {
            return false;
        }
    } else if (match = sel.match(/^::([\w-]+)$/)) {
        return false;
    } else if (match = sel.match(/^#([\w-]+)$/)) {
        return "(id " + match[1] + ")";
    } else if (match = sel.match(/^([\w-]+)$/)) {
        return "(tag " + match[1].toLowerCase() + ")";
    } else if (match = sel.match(/^\*$/)) {
        return "*";
    } else if (match = sel.match(/^\[type=\"([\w-]+)\"\]$/)) {
        return "(type " + match[1] + ")";
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
    if (val.match(/%$/)) {
        val = "(% " + val2pct(val, features) + ")";
    } else if (val.match(/e[mx]$/)) {
        val = "(em " + val2em(val, features) + ")";
    } else {
        val = "(px " + val2px(val, features) + ")";
    }
    return val;
}

function dump_color(val, features) {
    if (match = val.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/)) {
        return "(rgb " + match[1] + " " + match[2] + " " + match[3] + ")";
    } else if (match = val.match(/^rgba\((\d+),\s*(\d+),\s*(\d+),\s*([\d.]+)\)$/)) {
        if (match[4] == "1" || match[4] == "1.0") {
            return "(rgb " + match[1] + " " + match[2] + " " + match[3] + ")";
        } else if (match[4] == "0" || match[4] == "0.0") {
            return "transparent";
        } else {
            features["color:rgba"] = true;
        }
    } else {
        features["color:" + val.split("(", 1)[0]] = true;
    }
}

function dump_rule(sel, style, features, is_from_style, media) {
    var nodes;
    try {
        nodes = document.querySelectorAll(sel);
    } catch (e) {
        console.warn("Invalid selector syntax, this shouldn't happen:", sel);
        features["invalid-selector"] = true
        return "";
    }

    if (sel.indexOf(":after") !== -1 || sel.indexOf(":before") !== -1) {
        features["css:before-after"] = true;
    }
    var text = "";
    var has_good_prop = false;

    var em2px = null;

    for (var i = 0; i < style.length; i++) {
        var sname = style[i];
        if (sname.startsWith("-")) continue; // Skip browser-specific styles for now.

        if (BadProps.indexOf(sname) !== -1) {
            features["css:" + sname] = true;
        }

        var val = style[sname];

        var _features = Props.indexOf(sname) ? features : {};
        if (val == "inherit") {
            _features["css:inherit"] = true;
        } else if (val.startsWith("rgb")) {
            val = dump_color(val, _features);
        } else if (val.match(/^[a-z]+$/)) {
            // skip
        } else if (val.match(/^([-+0-9.e]+)([a-z%]+)$/)) {
            val = dump_length(val, _features);
        }
        
        if (Props.indexOf(sname) !== -1) {
            has_good_prop = true;
            var priority = style.getPropertyPriority(sname);
            if (priority !== "") {
                features["priority:" + priority] = true;
                text += "\n   [" + sname + " " + val + " :" + priority + "]";
            } else {
                text += "\n   [" + sname + " " + val + "]";
            }
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
        if (media && media.mediaText) {
            sel_text = "(media " + dump_media_query(media, features) + " " + sel_text + ")";
        }
        out += "\n  (" + sel_text + (is_from_style ? " :style" : "") + text + ")";
    }
    return out;
}

function dump_media_query(media, features) {
    var ors = media.mediaText.split(/\b,\s*\b/);
    for (var i = 0; i < ors.length; i++) {
        var query = ors[i].trim();
        var words = query.split(/\s/, 2);
        if (words[0] == "only" || words[0] == "not") {
            query = query.substring(words[0].length).trim();
        }

        var ands = query.split(/\band\b/);
        for (var j = 0; j < ands.length; j++) {
            var part = ands[j].trim();
            var match;
            if (match = part.match(/^\(\s*([a-zA-Z0-9\-]+)\s*:\s*(.*)\)$/)) {
                ands[j] = "(" + match[1] + " " + dump_length(match[2]) + ")";
            } else if (match = part.match(/^\(\s*([a-zA-Z0-9\-]+)\s*\)$/)) {
                ands[j] = "(" + match[1] + ")";
            } else if (match = part.match(/^([a-zA-Z0-9\-]+)$/)) {
                ands[j] = match[1];
            } else {
                console.warn("Unknown media query component", part);
                features["unknown-media"] = true
            }
        }

        if (words[0] == "only") {
            ands.prefix = "only";
        } else if (words[0] == "not") {
            ands.prefix = "not";
        } else {
            ands.prefix = false;
        }

        ors[i] = ands;
    }

    var text = "";
    if (ors.length > 1) text += "(or ";
    for (var i = 0; i < ors.length; i++) {
        var ands = ors[i];
        if (i > 0) text += " ";
        if (ands.prefix) text += "(" + ands.prefix + " ";
        if (ands.length > 1) text += "(and ";
        for (var j = 0; j < ands.length; j++) {
            if (j > 0) text += " ";
            text += ands[j];
        }
        if (ands.length > 1) text += ")";
        if (ands.prefix) text += ")";
    }
    if (ors.length > 1) text += ")";
    return text;
    
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

    recurse(page);
    return text;
}

function dump_stylesheet(ss, features, media) {
    var text = "";
    for (var rid in ss.cssRules) {
        if (!ss.cssRules.hasOwnProperty(rid)) continue;
        var r = ss.cssRules[rid];
        try {
            if (r.type === CSSRule.IMPORT_RULE) {
                console.warn("Skipping non-style rule", r);
                features["css:@import"] = true
                continue;
            } else if (r.type === CSSRule.MEDIA_RULE) {
                text += dump_stylesheet(r, features, r.media);
            } else if (r.type === CSSRule.STYLE_RULE) {
                text += dump_rule(r.selectorText, r.style, features, false, media);
            } else if (  r.type === CSSRule.MOZ_KEYFRAMES_RULE
                     || r.type === CSSRule.MOZ_KEYFRAME_RULE
                     || r.type === CSSRule.FONT_FACE_RULE) {
                // Don't need these...
            } else {
                console.warn("Unknown rule type", r);
                features["css:type-" + r.type + "-rule"] = true;
            }
        } catch (e) {
            console.warn(r, e);
            window.ERROR = e;
        }
    }
    return text;
}

ELTS = []

function get_inherent_size(e) {
    return {
        w: e.getBoundingClientRect().width,
        h: e.getBoundingClientRect().height,
    };
}

RTL_CHARS = "\u0591-\u07FF\uFB1d-\uFDFD\uFE70-\uFEFC";

function is_replaced(elt) {
    return (["IMG", "OBJECT", "INPUT", "IFRAME", "TEXTAREA"].indexOf(elt.tagName.toUpperCase()) !== -1);
}

function dump_document(features) {
    var elt = document.documentElement;
    
    function recurse(elt) {
        if (is_comment(elt)) {
            return false;
        } else if (is_text(elt)) {
            if (/[\u0591-\u07FF\uFB1d-\uFDFD\uFE70-\uFEFC]/.test(elt.textContent)) {
                features["unicode:rtl"] = true;
            }
            var r = new Range();
            r.selectNode(elt);
            if (r.getClientRects().length == 0) {
                return false;
            } else {
                return elt.textContent.replace(/\s+/g, " ");
            }
        } else if (elt.tagName.toUpperCase() === "HEAD" || elt.tagName.toUpperCase() === "SCRIPT") {
            return false;
        } else if (typeof(elt.dataset) === "undefined"){
            console.log("Weird element", elt);
            var rec = new Box(elt.tagName.toLowerCase(), elt, {fid: get_font_ID(cs(elt))});
            features["weird-element"] = true;
            return rec;
        } else {
            var num = ELTS.length;
            elt.dataset["num"] = num;
            ELTS.push(elt);
            var rec = new Box(elt.tagName.toLowerCase(), elt, {num: num, fid: get_font_ID(cs(elt))});
            if (elt.id) rec.props["id"] = elt.id;
            if (elt.classList.length) rec.props["class"] = ("(" + elt.classList + ")").replace(/#/g, "");

            if (is_replaced(elt)) {
                var v = get_inherent_size(elt);
                rec.props["w"] = v.w;
                rec.props["h"] = v.h;
            }

            if (elt.tagName.toUpperCase() === "INPUT") {
                rec.props["type"] = elt.type;
            }
            
            if (elt.dir) {
                rec.props["dir"] = elt.dir;
                features["attr:dir"] = true;
            }
            
            if (elt.tagName.toUpperCase() === "HR" && elt.size) {
                rec.props["size"] = elt.size;
                features["hr:size"] = true;
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
    return s;
}

MAX = 0;

function count_distinct(f, arr1, arr2) {
    var h = {};
    var c = 0;
    for (var i = 0; i < arr1.length; i++) {
        if (!h[f(arr1[i])]) c++;
        h[f(arr1[i])] = true;
    }
    for (var i = 0; i < arr2.length; i++) {
        if (!h[f(arr2[i])]) c++;
        h[f(arr2[i])] = true;
    }
    return c;
}

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
        if (bottom_outer(steps[i]) == y) {
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

    MAX = Math.max(count_distinct(function(x) {return bottom_outer(x)}, this.left, this.right), MAX);
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

function check_float_registers(box, features) {
    if (box.type === "TEXT") {
        if (box.props.y < box.flt.mark) {
            add_feature(box, "exclusion-zone");
            features["exclusion-zone"] = true;
        }
    }

    for (var i = 0; i < box.children.length; i++) {
        check_float_registers(box.children[i], features);
    }
}

function annotate_box_elt(box) {

    if (box.node && box.node.nodeType === document.ELEMENT_NODE) {
        if (typeof(box.node.dataset) !== "undefined") {
            box.props.elt = box.node.dataset["num"];
        }
    }

    for (var i = 0; i < box.children.length; i++) {
        annotate_box_elt(box.children[i]);
    }
}

function page2cassius(name) {
    var features = {};

    var text = "";
    text += "(define-stylesheet " + name;
    for (var sid in document.styleSheets) {
        text += dump_stylesheet(document.styleSheets[sid], features, document.styleSheets[sid].media);
    }

    var out = get_boxes(features);
    var doc = dump_document(features);
    var page = out.view;
    annotate_box_elt(page);
    
    compute_flt_pointer(page, null);
    features["float:" + MAX] = true;
    check_float_registers(page, features);

    var style = out.style;
    for (var eid in style) {
        if (!style.hasOwnProperty(eid)) continue;
        text += dump_rule("#" + eid, style[eid], features, true, false);
    }
    text += ")\n\n";

	text += dump_fonts(name);

    text += "\n\n(define-layout (" + name
    var props = {browser: "firefox", matched: "true", w: page.props.w, h: page.props.h, fs: 16 };
    for (var prop in props) {
        if (typeof props[prop] !== "undefined") {
            text += " :" + prop + " " + props[prop];
        }
    }
    text += ")\n ([VIEW :w " + page.props.w + "]";
    text += dump_tree(page.children[0]);
    text += "))\n\n";
    text += "(define-document " + name;
    text += dump_tree(doc);
    text += ")\n\n";

    var title = dump_string(document.title);
    text += "(define-problem " + name;
    text += "\n  :title " + title;
    text += "\n  :url \""  + location;
    text += "\"\n  :sheets " + name;
	text += "\n  :fonts " + name;
    text += "\n  :documents " + name;
    text += "\n  :layouts " + name;
    if (window.ERROR) {
        text += "\n  :error " + dump_string(window.ERROR + "");
        features["unknown-error"] = true;
    }
    text += "\n  :features " + dump_features(features) + ")";
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
    if (name) root.appendChild(pre);

    var r = document.createRange();
    r.selectNodeContents(pre);

    var sel = window.getSelection();
    sel.removeAllRanges();
    sel.addRange(r);
}

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

function measure_font(font, size, weight, style, txt, baseline) {
	var canvas = document.createElement("canvas");
	canvas.font = font;
	canvas.fontWeight = weight;
	canvas.fontStyle = style;
	var context = canvas.getContext("2d");
	context.font = font;
	context.fontWeight = weight;
	context.fontStyle = style;
	var width = context.measureText(txt).width;
	canvas.width = width + 1;
	canvas.height = size * 2;
	context.font = font;
	context.fontWeight = weight;
	context.fontStyle = style;
	context.fillStyle = "white";
	context.fillRect(0,0,width + 1,size * 2);
	context.fillStyle = "black";
	context.textBaseline = baseline;
	context.fillText(txt, 0, size);

	var pixelmap = context.getImageData(0, 0, width, size * 2);

	for (var i = 0; i < pixelmap.data.length; i += 4) {
		var y = Math.floor(i / (width * 4));
		if (pixelmap.data[i] !== 255) return y;
	}
	throw "Could not find any text in image!";
}

function get_font_lineheight(font, weight, style) {
	var body = document.querySelector("body");
	var div = document.createElement("CassiusBlock");
	div.innerHTML = "Hxy";
	body.appendChild(div);

	// reset
	div.style.borderTopStyle = "none";
	div.style.borderBottomStyle = "none";
	div.style.paddingTop = "0";
	div.style.paddingBottom = "0";
	div.style.height = "auto";
	div.style.minHeight = "0";
	div.style.maxHeight = "none";
	div.style.display = "block";
	div.style.overflow = "visible";
        div.style.clear = "both";

	div.style.font = font;
	div.style.fontWeight = weight;
	div.style.fontStyle = style;
	div.style.lineHeight = "normal";

	var div_rect = div.getBoundingClientRect();
	var lineheight = div_rect.height;
	body.removeChild(div);
	return lineheight;
}

function get_font_offsets(font, weight, style, A, D) {
	var body = document.querySelector("body");
	var div = document.createElement("CassiusBlock");
	var span = document.createElement("CassiusInline");
	span.innerHTML = "Hxy";
	div.appendChild(span);
	body.appendChild(div);

	// reset
	div.style.borderTopStyle = "none";
	div.style.borderBottomStyle = "none";
	div.style.paddingTop = "0";
	div.style.paddingBottom = "0";
	div.style.height = "auto";
	div.style.minHeight = "0";
	div.style.maxHeight = "none";
	div.style.display = "block";
	div.style.overflow = "visible";
        div.style.clear = "both";
	span.style.borderTopStyle = "none";
	span.style.borderBottomStyle = "none";
	span.style.paddingTop = "0";
	span.style.paddingBottom = "0";
	span.style.height = "auto";
	span.style.minHeight = "0";
	span.style.maxHeight = "none";
	span.style.display = "inline";
	span.style.overflow = "visible";

	div.style.font = font;
	div.style.fontWeight = weight;
	div.style.fontStyle = style;
	div.style.lineHeight = "10px";
	span.style.font = font;
	span.style.fontWeight = weight;
	span.style.fontStyle = style;
	span.style.lineHeight = "10px";

	var span_rect = span.getBoundingClientRect();
	var div_rect = div.getBoundingClientRect();

	var leading_top = (10 - (A + D))/2;
	var baseline = div_rect.top + leading_top + A;
	var top_offset = baseline - span_rect.top - A;
	var bottom_offset = span_rect.height - (A + D) - top_offset;

	body.removeChild(div);

	return { top: top_offset, bottom: bottom_offset };
}

function get_font_metrics(font, fname) {
	if (font.size == 0) return [FontIDMap[fname], 0, 0, 0, 0, 0];
	var bt = measure_font(font.name, font.size, font.weight, font.style, "Hxy", "top");
	var ba = measure_font(font.name, font.size, font.weight, font.style, "Hxy", "alphabetic");
	var bb = measure_font(font.name, font.size, font.weight, font.style, "Hxy", "bottom");
	var descent = ba - bb;
	var ascent = bt - ba;
	var offsets = get_font_offsets(font.name, font.weight, font.style, ascent, descent);
	var lineheight = get_font_lineheight(font.name, font.weight, font.style);
	
	return [FontIDMap[fname], dump_string(font.family), dump_string(font.weight),
	        dump_string(font.style), ascent, descent, offsets.top, offsets.bottom, lineheight];
}

function dump_fonts(name) {
	var flist = [];
	var fonts = Object();
	var elt = document.documentElement;

	function recurse(elt) {
        if (elt.nodeType === document.ELEMENT_NODE) {
			var style = cs(elt);
			var fname = [style.fontSize, style.fontFamily, style.fontWeight, style.fontStyle].join(" ");
			var size = val2px(style.fontSize);
			var font = {name: style.fontSize + " " + style.fontFamily, family: style.fontFamily, size: size, weight: style.fontWeight, style: style.fontStyle};

			if (!fonts[fname]) { flist.push(fname); fonts[fname] = font; }

            for (var i = 0; i < elt.childNodes.length; i++) {
                if (is_comment(elt.childNodes[i])) continue;
                recurse(elt.childNodes[i]);
            }
        }
    }

    recurse(elt);

    var text = "(define-fonts " + name;
    for (var fname of flist) {
		var font = fonts[fname];
        var metrics = get_font_metrics(font, fname);
        for (var i = 1; i < metrics.length; i++) {
	         if (typeof metrics[i] !== "string") {
	             metrics[i] = f2r(metrics[i]);
	         }
		}
	    text += "\n  [" + metrics.join(" ") + "]";
    }
    text += ")";

    return text;
}
