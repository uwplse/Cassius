/*
javascript:void((function(x){x.src = "http://localhost:8000/get_example.js"; document.querySelector("head").appendChild(x)})(document.createElement("script")));
*/

function is_text(elt) {return elt.nodeType == document.TEXT_NODE;}
function is_block(elt) {
    var cStyle = elt.currentStyle || window.getComputedStyle(elt);
    return cStyle.display == "block";
}
function has_text(elt) {
    for (var i = 0; i < root.childNodes.length; i++) {
        var elt = root.childNodes[i];
        if (elt.textContent.strip() !== "") return true;
    }
    return false;
}
function has_normal_position(elt) {
    var cStyle = elt.currentStyle || window.getComputedStyle(elt);
    return elt.getBoundingClientRect().height > 0 && (cStyle.position == "static" || cStyle.position == "relative");
}

function parse_color(s) {
    if (s.indexOf("(") > -1) {
        var a = s.substring(s.indexOf("(") + 1, s.indexOf(")")).split(", ").map(function(s) {return parseInt(s)});
        var hexval = (a[3] << 24) | (a[0] << 16) | (a[1] << 8) | a[2];
        return "(color |#x" + hexval.toString(16) + "|)";
    } else {
        return s;
    }
}

function printblock(root, indent, f) {
    var rect = root.getBoundingClientRect();
    var bgc = parse_color(window.getComputedStyle(root).backgroundColor);
    var fgc = parse_color(window.getComputedStyle(root).color);
    f("open", indent, root.nodeName, rect.width, rect.height, rect.x, rect.y, bgc, fgc);

    var lines = [];
    for (var i = 0; i < root.childNodes.length; i++) {
        var elt = root.childNodes[i];
        if (elt.nodeType && !is_text(elt) && has_normal_position(elt) && is_block(elt)) {
            printblock(elt, indent + 1, f);
        } else if (is_text(elt) || has_normal_position(elt)) {
            var r = new Range();
            r.selectNode(elt);
            lines = lines.concat(r.getClientRects().slice());
        }
    }
    printlines(lines, indent + 1, f);

    f("close", indent);
}

function printlines(lines, indent, f) {
    
}

function gensym(name) {
    return name + Math.random();
}

function r2(x) {
    return Math.round(10*x)/10;
}

function go() {
    var root = document.querySelector("body");
    // Ensure that we don't have to worry about scroll bars
    document.querySelector("html").style.overflowX = "scroll";
    document.querySelector("html").style.overflowY = "scroll";

    var DOC = gensym("doc");
    var HTML = gensym("html");

    var types = {};
    var head = ",@(make-dom '" + HTML + " '" + DOC + "\n'";
    var tail = "(assert (! (= (w (" + DOC + "f " + HTML + ")) " + window.innerWidth + ") :named " + HTML + "-width))\n";
    
    printblock(document.querySelector("body"), 1, function(call, indent, type, w, h, x, y, bgc, fgc) {
        if (call == "open") {
            var ELT = gensym(type);
            head += "([&lt;" + type + "&gt; " + ELT + " " + type + "-rule]";
            types[type] = true;

            tail += "(assert (! (= (x (" + DOC + "f " + ELT + ")) " + r2(x) + ") :named " + ELT + "-x))\n";
            tail += "(assert (! (= (y (" + DOC + "f " + ELT + ")) " + r2(y) + ") :named " + ELT + "-y))\n";
            tail += "(assert (! (= ,(vw '(" + DOC + "f " + ELT + ")) " + r2(w) + ") :named " + ELT + "-w))\n";
            tail += "(assert (! (= ,(vh '(" + DOC + "f " + ELT + ")) " + r2(h) + ") :named " + ELT + "-h))\n";
            tail += "(assert (! (= (fgc (" + DOC + "f " + ELT + ")) " + fgc + ") :named " + ELT + "-fg))\n";
            tail += "(assert (! (= (bgc (" + DOC + "f " + ELT + ")) " + bgc + ") :named " + ELT + "-bg))\n";
        } else if (call == "close") {
            head += ")\n";
        }
    });
    head += ")\n";

    var rules = ",@(make-preamble)\n";
    for (var type in types) {
        rules += ",@(make-rule '" + type + "-rule '" + type + ")\n";
    }

    var pre = document.createElement("pre");
    pre.innerHTML = rules + "\n\n" + head + "\n\n" + tail;
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
