/*
javascript:void((function(x){x.src = "http://localhost:8000/capture/all.js"; document.querySelector("head").appendChild(x)})(document.createElement("script")));
*/
var Props = "width height margin-top margin-right margin-bottom margin-left padding-top padding-right padding-bottom padding-left border-top-width border-right-width border-bottom-width border-left-width float display text-align border-top-style border-right-style border-bottom-style border-left-style overflow-x overflow-y position top bottom left right box-sizing min-width max-width min-height max-height font-size font-family font-style font-weight text-indent clear color background-color line-height vertical-align".split(" ");
var BadProps = "clear float direction min-height max-height max-width min-width overflow-x overflow-y position box-sizing white-space font-size text-indent vertical-align".split(" ");
var BadTags = "img iframe input svg:svg button frame noframes".split(" ");

class Box {
    children : Box[];
    type : string;
    props : any;
    node : Node;

    constructor(type, node, props) {
        this.children = [];
        this.type = type; this.props = props; this.node = node;
    }
}
function curry(f, arg) { return function(arg1, arg2) { return new f(arg, arg1, arg2) }}
var Block = curry(Box, "BLOCK");
var Line = curry(Box, "LINE")
var Inline = curry(Box, "INLINE")
var Page = curry(Box, "PAGE")
var TextBox = curry(Box, "TEXT")
var Magic = curry(Box, "MAGIC")
var Anon = curry(Box, "ANON")


Box.prototype.toString = function() {
    var s = "[" + this.type;
    for (var i in this.props) {
        var val = this.props[i];
        s += " :" + i + " " + (typeof val === "number" ? f2r(val) : val);
    }
    return s + "]";
}

var ERROR : (boolean | string) = false;
var SKIP_NO_MATCH = false;

var LETTER = "";
var ID = 0;
var PADDING = "0000";
function gensym() {
    var s = "" + (++ID);
    return "e" + LETTER + PADDING.substring(0, PADDING.length - s.length) + s;
}

import { f2r, MIN_LENGTH, val2px, val2pct, val2em, cs, dump_string, is_comment } from "./util";

function is_text(elt) {return elt.nodeType == document.TEXT_NODE || elt.nodeType == document.CDATA_SECTION_NODE;}
function is_inline(elt) {return cs(elt, "display") == "inline";}
function is_iblock(elt) {return cs(elt, "display") == "inline-block";}
function is_block(elt) {
    return cs(elt, "display") == "block" ||
        (cs(elt, "display") == "list-item" &&
         (cs(elt, "list-style-position") == "outside" ||
          cs(elt, "list-style-type") == "none"));
}
function is_visible(elt) {return cs(elt, "display") != "none";}

function is_flow_block(elt) {
    return elt.nodeType == document.ELEMENT_NODE &&
        cs(elt, "float") === "none" && ["static", "relative"].indexOf(cs(elt, "position")) !== -1;
}

function get_fontsize(elt) {
    var fs = cs(elt, "font-size");
    try { return val2px(fs, {}) } catch (e) {}
    try { return val2pct(fs, {}) * get_fontsize(elt.parentNode) / 100 } catch (e) {}
    try { return val2em(fs, {}) * get_fontsize(elt.parentNode) } catch (e) {}
    throw "Error weird font-size value " + fs;
}

function convert_margin(margin, elt) {
    try { return val2px(margin, {}) } catch (e) {}
    try { return val2pct(margin, {}) * elt.clientWidth } catch (e) {}
    try { return val2em(margin, {}) * get_fontsize(elt) } catch (e) {}
    throw "Error weird margin value `" + margin + "`";
}

function convert_offset(offset, elt) {
    if (offset == "auto") {
        return 0;
    } else if (offset.match(/%$/)) {
        return val2pct(offset, {}) * elt.parentNode.clientHeight;
    } else {
        return val2px(offset, {});
    }
}

function get_margins(elt) {
    while (elt.nodeType !== document.ELEMENT_NODE) elt = elt.parentNode;
    return {
        top: convert_margin(cs(elt, "margin-top"), elt),
        right: convert_margin(cs(elt, "margin-right"), elt),
        bottom: convert_margin(cs(elt, "margin-bottom"), elt),
        left: convert_margin(cs(elt, "margin-left"), elt)
    };
}

function get_relative_offset(elt) {
    while (elt.nodeType !== document.ELEMENT_NODE) elt = elt.parentNode;
    return {
        top: convert_offset(cs(elt, "top"), elt),
        bottom: convert_offset(cs(elt, "bottom"), elt),
        left: convert_offset(cs(elt, "left"), elt),
        right: convert_offset(cs(elt, "right"), elt),
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

    var mid = Math.round(loff + (roff - loff) / 2);
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
    var ranges : Range[] = [];
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

function infer_anons(inputs) {
    var estack = [inputs];
    var out : Box[] = [];
    var bstack = [out];
    var block_mode = true;

    function reenter(estack) {
        var b = Anon(null, {});
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
            } else if (e.type == "INLINE" && cs(e.node, "display") == "inline-block") {
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
        if (prev.props.br === "") return false;
        var ph = prev.props.h;
        var py = prev.props.y;
        var px = prev.props.x;
        var pw = prev.props.w;
        var m = get_margins(prev.node);
        ph += m.top + m.bottom;
        py -= m.top;
        if (prev.node.nodeType == document.ELEMENT_NODE) {
            // Ultimately we need a horizontal cursor, not this nonsense.
            pw += m.left + m.right
            px -= m.left;
        }
        var pos = get_relative_offset(prev.node);
        if (pos.top) py -= pos.top;
        else if (pos.bottom) py += pos.bottom;
        if (pos.left) px -= pos.left;
        else if (pos.right) px += pos.right;

        var th = txt.props.h;
        var ty = txt.props.y;
        var tx = txt.props.x;
        var m = get_margins(txt.node);
        th += m.top + m.bottom;
        ty -= m.top;
        if (txt.node.nodeType == document.ELEMENT_NODE) {
            tx -= m.left;
        }
        var pos = get_relative_offset(txt.node);
        if (pos.top) ty -= pos.top;
        else if (pos.bottom) ty += pos.bottom;
        if (pos.left) tx -= pos.left;
        else if (pos.right) tx += pos.right;

        var horiz_adj = (ty + th >= py && py >= ty || py + ph >= ty && ty >= py)

        // Note fuzziness
        return horiz_adj && tx >= px + pw - MIN_LENGTH;
    }

    function stackup(l, stack, sstack) {
        for (var i = 0; i < stack.length; i++) {
            if (!sstack[i]) {
                var newprops = Object.assign({}, stack[i].props);
                var sselt = new Box(stack[i].type, stack[i].node, newprops);
                (i == 0 ? l : sstack[i - 1]).children.push(sselt);
                sstack.push(sselt);
            }
        }
    }

    var stack : Box[] = [];
    var sstack : Box[] = [];
    var last = false; // Handles last in-flow element; skips floats/positioned
    function go(b) {
        if (b.type == "BLOCK") {
            // Handles case of floating block
            var l = last_line() || new_line();
            stackup(l, stack, sstack);
            (sstack.length === 0 ? l : sstack[sstack.length-1]).children.push(b);
        } else if (b.type == "TEXT" || b.type == "MAGIC" ||
                   (b.type == "INLINE" && b.node && (is_replaced(b.node) || is_iblock(b.node)))) {
            var l = last_line() || new_line();
            if (!fits(b, last)) {
                l = new_line();
                sstack = [];
            }
            stackup(l, stack, sstack);
            (sstack.length === 0 ? l : sstack[sstack.length-1]).children.push(b);
            last = b;
        } else if (b.type == "INLINE") {
            stack.push(b);
            for (var i = 0; i < b.children.length; i++) {
                var child = b.children[i];
                go(child);
            }
            stackup(last_line() || new_line(), stack, sstack);
            stack.pop();
            sstack = sstack.slice(0, stack.length);
            if (b.node && b.node.tagName.toUpperCase() == "BR") {
                new_line();
                sstack = [];
            }
        } else {
            console.warn("Unknown box type", b);
            ERROR = "Unknown box type: " + b;
        }
    }

    for (var i = 0; i < box.children.length; i++) {
        var child = box.children[i];
        go(child);
    }
}

declare global {
    interface ClientRect {
        x: number; y: number; top: number; right: number; bottom: number; left: number;
    }
}

function extract_text(elt) {
    var outs : Box[] = [];
    var ranges = get_lines(elt);
    for (var i = 0; i < ranges.length; i++) {
        var rs = ranges[i].getClientRects();
        if (rs.length > 1) throw "Error, multiple lines in one line: "+ranges[i].toString();
        if (rs.length < 1) continue;
        var r = rs[0];
        var box = TextBox(elt, {x: r.x, y: r.y, w: r.width, h: r.height});
        box.props.text = dump_string(ranges[i].toString().replace(/\s+/g, " "));
        outs.push(box);
    }
    for (var i = 0; i < outs.length - 1; i++) {
        outs[i].props.br = "";
    }
    return outs;
}

function extract_block(elt, children, features) {
    var r = elt.getBoundingClientRect();

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
    if (elt.tagName.toUpperCase() == "OPTION") box.props.x -= 1;
    box.children = children;

    if (cs(elt, "display") == "list-item" && children.length == 0) {
        children.push(Line(null, {}));
    }

    try {
        annotate_inlines(box);
    } catch {
        features["inlines:weird"] = true;
    }
    return box;
}

function annotate_inlines(box) {
    var elements : Element[] = [];
    var boxes : Box[][] = [];
    function collect_by_elt(b) {
        for (var i = 0; i < b.children.length; i++) {
            // Skip blocks that we've already gone and annotated
            if (b.children[i].type == "BLOCK") continue;
            collect_by_elt(b.children[i]);
        }
        if (!b.node) return;
        if (b.type != "INLINE") return;
        var idx = elements.indexOf(b.node);
        if (idx === -1) {
            idx = elements.length;
            elements.push(b.node);
            boxes.push([]);
        }
        boxes[idx].push(b);
    }
    collect_by_elt(box);
    for (var i = 0; i < elements.length; i++) {
        var rects = elements[i].getClientRects();
        if (rects.length !== boxes[i].length) {
            throw "Rect/box invariant does not hold for #" + elements[i].id + 
                " " + rects.length + " " + boxes[i].length;
        }
        for (var j = 0; j < boxes[i].length; j++) {
            var p = boxes[i][j].props;
            var r = rects[j];
            // For replaced elements, this overwrites existing values
            Object.assign(p, {x: r.x, y: r.y, w: r.width, h: r.height});
        }
    }
}

function extract_inline(elt, children) {
    // Inline sizes are handled by annotate_inlines after line breaking;
    // however, for replaced elements we need sizes for line breaking.
    var rects = elt.getClientRects();
    var props = {};
    if (rects.length == 1) {
        props = { x: rects[0].x, y: rects[0].y, w: rects[0].width, h: rects[0].height };
    }
    var box = Inline(elt, props);
    box.children = children;
    return box;
}

function extract_magic(elt, children) {
    var r = elt.getBoundingClientRect();
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
    } else if (["none", "inline", "block"].indexOf(cs(elt, "display")) !== -1) {
        // ok
    } else if (cs(elt, "display").substr(0, 5) == "table") {
        features["display:table"] = true;
    } else if (cs(elt, "display") == "inline-block") {
        features["display:inline-block"] = true;
    } else if (cs(elt, "display") == "list-item") {
        features["display:list-item"] = true;
    } else {
        console.warn("Unclear element-like value, display: " + cs(elt, "display"), elt.nodeType, elt);
        features["display:unknown"] = true;
    }

    if (elt.nodeType == document.ELEMENT_NODE &&
        cs(elt, "display") == "list-item" && cs(elt, "list-style-position") == "inside" && cs(elt, "list-style-type") != "none") {
        features["list:inside"] = true;
    }

    var children : Box[] = [];
    for (var i = 0; i < elt.childNodes.length; i++) {
        children = children.concat(make_boxes(elt.childNodes[i], styles, features));
    }

    if (is_comment(elt)) {
        return [];
    } else if (elt.dataset && elt.dataset["cassius"] == "magic") {
        return [extract_magic(elt, children)];
    } else if (is_text(elt)) {
        var out = extract_text(elt);
        var out2 = out.filter(function(x) {return x.props.w !== 0 || x.props.h !== 0});
        if (out.length !== out2.length) features["empty-text"] = true;
        return out2;
    } else if (!is_visible(elt)) {
        return [];
    } else if ((is_block(elt) || is_iblock(elt))) {
        var box = extract_block(elt, children, features);
        if (is_iblock(elt)) box.type = "INLINE";
        return [box];
    } else if (is_inline(elt)) {
        return [extract_inline(elt, children)];
    } else {
        return [extract_magic(elt, children)];
    }
}

function get_boxes(style, features) {
    window.scrollTo(0, 0);
    var view = Page(document, {w: window.innerWidth, h: window.innerHeight});
    view.children = make_boxes(document.documentElement, style, features);
    return view;
}

function dump_selector(sel) {
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
    } else if (sel.match(/^([\w-]+|\*)?((::?|\.|\#)[\w-]+|\[type=\"[\w-]+\"\])*$/)) {
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
    var match;
    if (match = sel.match(/^\.([\w-]+)$/)) {
        return "(class " + match[1] + ")";
    } else if (match = sel.match(/^:([\w-]+)$/)) {
        if (["first-child", "last-child", "hover", "last-of-type", "first-of-type"].indexOf(match[1]) !== -1) {
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
    var ids : string[] = [];
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
    } else if (val.match(/[0-9.]e[mx]$/)) {
        val = "(em " + val2em(val, features) + ")";
    } else if (val.match(/[0-9.]rem$/)) {
        val = "(rem " + val2em(val, features) + ")";
    } else if (val.match(/[0-9.]s$/)) {
        val = "(s " + val.slice(0,-1) + ")"; // Not supported, just to avoid error message
    } else {
        val = "(px " + f2r(val2px(val, features)) + ")";
    }
    return val;
}

function dump_color(val, features) {
    var match
    if (match = val.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/)) {
        return "(rgb " + match[1] + " " + match[2] + " " + match[3] + ")";
    } else if (match = val.match(/^rgba\((\d+),\s*(\d+),\s*(\d+),\s*([\d.]+)\)$/)) {
        if (match[4] == "1" || match[4] == "1.0") {
            return "(rgb " + match[1] + " " + match[2] + " " + match[3] + ")";
        } else if (match[4] == "0" || match[4] == "0.0") {
            return "transparent";
        } else {
            features["color:rgba"] = true;
            return "(rgba " + match[1] + " " + match[2] + " " + match[3] + " " + match[4] + ")";
        }
    } else {
        features["color:" + val.split("(", 1)[0]] = true;
        throw "Invalid color " + val;
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
    if (SKIP_NO_MATCH) if (nodes.length == 0) return "";

    if (sel.indexOf(":after") !== -1 || sel.indexOf(":before") !== -1) {
        features["css:before-after"] = true;
    }
    var text = "";
    var has_good_prop = false;

    for (var i = 0; i < style.length; i++) {
        var sname = style[i];
        if (sname.startsWith("-")) continue; // Skip browser-specific styles for now.

        if (BadProps.indexOf(sname) !== -1) {
            features["css:" + sname] = true;
        }

        var val = style[sname];

        var _features = Props.indexOf(sname) !== -1 ? features : {};
        if (val == "inherit") {
            _features["css:inherit"] = true;
        } else if (val.startsWith("rgb") && val.endsWith(")")) {
            val = dump_color(val, _features);
        } else if (sname === "font-family") {
            val = dump_string(val);
        } else if (val.match(/^calc\(/)) {
            features["unit:calc"] = true;
            val = "0"
        } else if (val.match(/^[a-z]+$/)) {
            // skip
        } else if (val.match(/^([-+0-9.e]+)([a-z%]+)$/)) {
            try {
                val = dump_length(val, _features);
            } catch (e) {
                console.warn(sel, e);
                ERROR = e;
            }
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

        if ((sname == "overflow-x" || sname == "overflow-y") && val == "auto") {
            features["overflow:auto"] = true;
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
            features["@media"] = true;
            sel_text = "(media " + dump_media_query(media, features) + " " + sel_text + ")";
        }
        out += "\n  (" + sel_text + (is_from_style ? " :style" : "") + text + ")";
    }
    return out;
}

function dump_media_query(media, features) {
    var ors = media.mediaText.split(/,\s*/);
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
                ands[j] = "(" + match[1] + " " + dump_length(match[2], features) + ")";
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
            } else if ( r.type === CSSRule.KEYFRAMES_RULE
                     || r.type === CSSRule.KEYFRAME_RULE
                     || r.type === CSSRule.FONT_FACE_RULE) {
                // Don't need these...
            } else {
                console.warn("Unknown rule type", r);
                features["css:type-" + r.type + "-rule"] = true;
            }
        } catch (e) {
            console.warn(r, e);
            ERROR = e;
            features["unknown-error"] = true;
        }
    }
    return text;
}

function get_inherent_size(e) {
    return {
        w: e.getBoundingClientRect().width,
        h: e.getBoundingClientRect().height,
    };
}

var RTL_CHARS = /[\u0591-\u07FF\uFB1d-\uFDFD\uFE70-\uFEFC]/;

function is_replaced(elt) {
    return (["IMG", "OBJECT", "INPUT", "IFRAME", "TEXTAREA"].indexOf(elt.tagName.toUpperCase()) !== -1);
}

function dump_document(features) {
    var elt = document.documentElement;
    var ELTS : Node[] = []
    
    function recurse(elt) {
        if (is_comment(elt)) {
            return false;
        } else if (is_text(elt)) {
            if (RTL_CHARS.test(elt.textContent)) {
                features["unicode:rtl"] = true;
            }
            var r = new Range();
            r.selectNode(elt);
            if (r.getClientRects().length == 0) {
                return false;
            } else {
                return elt.textContent.replace(/\s+/g, " ");
            }
        } else if (typeof(elt.dataset) === "undefined"){
            console.log("Weird element", elt);
            var rec = new Box(elt.tagName.toLowerCase(), elt, {});
            features["weird-element"] = true;
            return rec;
        } else {
            var num = ELTS.length;
            elt.dataset["num"] = num;
            ELTS.push(elt);
            var rec = new Box(elt.tagName.toLowerCase(), elt, {num: num});
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

import { MAX, compute_flt_pointer, check_float_registers } from "./ezone";
import { dump_fonts } from "./fonts";
import { dump_browser } from "./browser";
import { dump_script } from "./scripts"

export function page2text(name) {
    LETTER = name;
    var features = {};

    var text = "";
    text += "(define-stylesheet " + name;
    for (var sheet of document.styleSheets) {
        try {
            text += dump_stylesheet(sheet, features, sheet.media);
        } catch (e) {
            console.warn(sheet, e);
            ERROR = e;
            features["unknown-error"] = true;
        }
    }

    var style = {}
    var page = get_boxes(style, features);
    var doc = dump_document(features);
    annotate_box_elt(page);
    
    compute_flt_pointer(page, null, null);
    features["float:" + MAX] = true;
    check_float_registers(page, features);

    for (var eid in style) {
        if (!style.hasOwnProperty(eid)) continue;
        text += dump_rule("#" + eid, style[eid], features, true, false);
    }
    text += ")\n\n";

    text += dump_fonts(name, features) + "\n";
    text += dump_browser(name, features) + "\n";

    text += "(define-document " + name;
    text += dump_tree(doc);
    text += ")\n\n";

    text += "(define-layout " + name + " (" + name + " " + name + ")\n";
    text += " ([VIEW :w " + page.props.w + "]";
    text += dump_tree(page.children[0]);
    text += "))\n\n";
    
    var n_scripts = 0;
    for (var script of document.querySelectorAll("script")) {
        if (script.src) continue;
        n_scripts++;
        text += "(define-script " + name + "." + n_scripts +"\n";
        text += dump_script(script.textContent);
        text += ")\n\n";
    }

    text += "(define-problem " + name;
    text += "\n  :title " + dump_string(document.title);
    text += "\n  :url "  + dump_string("" + location);
    text += "\n  :sheets firefox " + name;
    text += "\n  :fonts " + name;
    text += "\n  :layouts " + name;
    if (n_scripts) {
        text += "\n  :script";
        for (var i = 1; i <= n_scripts; i++)
            text += n_scripts + " ";
    }
    if (ERROR) {
        text += "\n  :error " + dump_string(ERROR + "");
        features["unknown-error"] = true;
    }
    text += "\n  :features " + dump_features(features) + ")";
    return text;
}

