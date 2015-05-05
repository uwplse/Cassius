/*
javascript:void((function(x){x.src = "http://localhost:8000/get_example.js"; document.querySelector("head").appendChild(x)})(document.createElement("script")));
*/

LETTER = window.LETTER || "";

function r2(x) {return Math.round(10*x)/10;}
function cs(elt) {return window.getComputedStyle(elt);}

function is_text(elt) {return elt.nodeType == document.TEXT_NODE;}
function is_comment(elt) {return elt.nodeType == document.COMMENT_NODE;}
function is_inline(elt) {return cs(elt).display == "inline";}
function is_block(elt) {return cs(elt).display == "block";}
function is_visible(elt) {return cs(elt).display != "none";}
function has_normal_position(elt) {
    return elt.getBoundingClientRect().height > 0 && (cs(elt).position == "static" || cs(elt).position == "relative");
}

function printblock(root, f) {
    var rect = root.getBoundingClientRect();
    f("open", root.nodeName, rect.width, rect.height, rect.x, rect.y);

    var lines = [];
    for (var i = 0; i < root.childNodes.length; i++) {
        var elt = root.childNodes[i];
        if (is_comment(elt)) {
            continue; // Comments are part of the DOM. Why? Meh.
        } else if (is_text(elt) || is_inline(elt)) {
            var r = new Range();
            r.selectNode(elt);
            lines = lines.concat(r.getClientRects().slice());
        } else if (!is_visible(elt)) {
            continue;
        } else if (is_block(elt)) {
            printblock(elt, f);
        } else {
            console.warn("Unclear element-like value", elt.nodeType, elt);
            continue;
        }
    }
    if (lines.length > 0) printlines(root, lines, f);

    f("close");
}

function val2px(val) {
    if (val.endsWith("px")) {
        return +val.substr(0, val.length - 2);
    } else {
        throw "Error"
    }
}

function printlines(root, lines, f) {
    for (var i = 0; i < lines.length; i++) {
        var line = lines[i];
        var gap = val2px(cs(root).lineHeight) - line.height;
        f("line", "", line.width, line.height, line.x, line.y, gap);
    }
}

ID = 0;
PADDING = "0000";

function gensym(name) {
    s = "" + (++ID);
    return LETTER + PADDING.substring(0, PADDING.length - s.length) + s;
}

function go() {
    var root = document.querySelector("body");
    var DOC = gensym("doc");
    var HTML = gensym("html");

    var head = "(define dom" + LETTER + "\n  (let ([tree";
    var quoted = false;
    var indent = "         ";

    var wrect = document.querySelector("html").getBoundingClientRect();
    var tail = "]\n       [context (rendering-context " + wrect.width + ")])\n" +
        "    (dom 'doc" + LETTER + " sheet context tree)))\n\n";
    
    printblock(document.querySelector("body"), function(call, type, w, h, x, y, bgc, fgc) {
        if (call == "open") {
            var ELT = gensym();

            var idt = indent;
            indent = indent + " ";
            if (!quoted) {
                idt = idt.substring(0, idt.length - 1) + "'";
                quoted = true;
            }
            
            head += "\n" + idt + "([&lt;" + type + "&gt; " + ELT;

            head += " :x " + r2(x);
            head += " :y " + r2(y);
            head += " :vw " + r2(w);
            head += " :vh " + r2(h);
            head += "]";
        } else if (call == "close") {
            head += ")";
            indent = indent.substring(0, indent.length - 1);
        } else if (call == "line") {
            var ELT = gensym();
            var gap = bgc; // Because different calls use different numbers of arguments

            var idt = indent;
            if (!quoted) {
                idt = idt.substring(0, idt.length - 1) + "'";
                quoted = true;
            }
            
            head += "\n" + idt + "([&lt;&gt; " + ELT;

            head += " :x " + r2(x);
            head += " :y " + r2(y);
            head += " :w " + r2(w);
            head += " :h " + r2(h);
            head += " :gap " + r2(gap);
            head += "])";
        }
    });

    var pre = document.createElement("pre");
    pre.id = "--cassius-output-block";
    pre.innerHTML = head + tail;
    pre.style.background = "white";
    pre.style.color = "black";
    pre.style.position = "absolute";
    pre.style.top = "0";
    pre.style.left = "0";
    pre.style.zIndex = "1000000";
    root.appendChild(pre);

    var r = document.createRange();
    r.selectNodeContents(pre);

    var sel = window.getSelection();
    sel.removeAllRanges();
    sel.addRange(r);
}

go();

function draw_rect(rect) {
    var d = document.createElement("flarg");
    d.style.position = "absolute";
    d.style.top = rect.top + "px";
    d.style.left = rect.left + "px";
    d.style.width = rect.width + "px";
    d.style.height = rect.height + "px";
    d.style.outline = "1px solid red";
    document.querySelector("html").appendChild(d);
}
