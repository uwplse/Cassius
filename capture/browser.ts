import { val2px, cs } from "./util"

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
    outer.remove();
    return out;
}


function default_font_size(family, features) {
    var body = document.body;
    var div = document.createElement("CassiusBlock");
    body.appendChild(div);
    div.style.fontFamily = family;
    div.style.fontSize = "medium";
    div.style.fontWeight = "400";
    div.style.fontStyle = "normal";
    var out = val2px(cs(div, "font-size"), features);
    div.remove();
    return out;
}

function browser_info(features) {
    return {
        matched: "true",
        w: window.innerWidth,
        h: window.innerHeight,
        fs: default_font_size("serif", features),
        fsm:  default_font_size("monospace", features),
        scrollw: compute_scrollbar_width(),
    };
}

export function dump_browser(name, features) {
    var info = browser_info(features);
    var out = "(define-browser " + name
    for (var field in info) {
        if (!info.hasOwnProperty(field)) return;
        out += "\n  :" + field + " " + info[field];
    }
    out += ")\n";
    return out;
}
