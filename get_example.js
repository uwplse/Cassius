/*
javascript:void((function(x){x.src = "http://localhost:8000/get_example.js"; document.querySelector("head").appendChild(x)})(document.createElement("script")));
*/

function is_text(elt) {return elt.nodeType == 3;}
function is_block(elt) {
    var cStyle = elt.currentStyle || window.getComputedStyle(elt, "");
    return cStyle.display == "block";
}

function printall(root, indent, f) {
    var rect = root.getBoundingClientRect();
    f("open", indent, root.nodeName, rect.width, rect.height, rect.x, rect.y);

    for (var i = 0; i < root.childNodes.length; i++) {
        var elt = root.childNodes[i];
        if (elt.nodeType && !is_text(elt) && is_block(elt)) {
            printall(elt, indent + 1, f);
        }
    }

    f("close", indent);
}

function gensym(name) {
    return name + Math.random();
}

function go() {
    var root = document.querySelector("body");

    var DOC = gensym("doc");
    var HTML = gensym("html");

    var types = {};
    var head = ",@(make-dom '" + HTML + " '" + DOC + "\n'";
    var tail = "(assert (! (= (w (" + DOC + "f " + HTML + ")) " + window.innerWidth + ") :named " + HTML + "-width))\n";
    
    printall(document.querySelector("body"), 1, function(call, indent, type, w, h, x, y) {
        if (call == "open") {
            var ELT = gensym(type);
            head += "([&lt;" + type + "&gt; " + ELT + " " + type + "-rule]\n";
            types[type] = true;

            tail += "(assert (! (= (x (" + DOC + "f " + ELT + ")) " + x + ") :named " + ELT + "-x))\n";
            tail += "(assert (! (= (y (" + DOC + "f " + ELT + ")) " + y + ") :named " + ELT + "-y))\n";
            tail += "(assert (! (= ,(vw '(" + DOC + "f " + ELT + ")) " + w + ") :named " + ELT + "-w))\n";
            tail += "(assert (! (= ,(vh '(" + DOC + "f " + ELT + ")) " + h + ") :named " + ELT + "-h))\n";
        } else if (call == "close") {
            head += ")";
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
