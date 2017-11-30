
function estimate_scrollbar() {
    var html = document.documentElement;
    if (window.scrollMaxY !== 0) throw "Error: page already has scrollbar!";
    var width = html.clientWidth;
    html.style.height = window.innerHeight * 10 + "px";
    return width - html.clientWidth;
}

function exfiltrate(val) {
    var pre = document.createElement("pre");
    pre.id = "-x-cassius-output-block";
    pre.innerText = "" + val;
    with (pre.style) {
        background = "white", color = "black";
        position = "absolute", top = "0", left = "0";
        zIndex = "1000000";
    }

    var root = document.documentElement;
    root.appendChild(pre);

    var r = document.createRange();
    r.selectNodeContents(pre);

    var sel = window.getSelection();
    sel.removeAllRanges();
    sel.addRange(r);
}
