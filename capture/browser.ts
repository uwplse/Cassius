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
    document.body.removeChild(outer)
    return out;
}


function default_font_size(family, features) {
    var body = document.body;
    var div = document.createElement("CassiusBlock");
    body.appendChild(div);
    div.style.fontFamily = family;
    return val2px(cs(div, "font-size"), features);
}

export function browser_info(features) {
    return {
        matched: "true",
        w: window.innerWidth,
        h: window.innerHeight,
        fs: default_font_size("serif", features),
        fsm:  default_font_size("monospace", features),
        scrollw: compute_scrollbar_width(),
    };
}
