import { val2px, cs, dump_string, is_comment, f2r } from "./util";

// Start of real stuff

function get_font_metrics(font) {
    var body = document.body;
    var div = document.createElement("CassiusBlock");
    var img = document.createElement("img");
    div.appendChild(img);
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

    div.style.fontFamily = font.family;
    div.style.fontSize = font.size + "px";
    div.style.fontWeight = font.weight;
    div.style.fontStyle = font.style;
    div.style.lineHeight = font.size + "px";

    img.style.height = font.size*2 + "px";
    img.style.width = "1px";
    img.style.borderTopStyle = "none";
    img.style.borderBottomStyle = "none";
    img.style.verticalAlign = "baseline";
    img.style.lineHeight = "normal";
    img.style.float = "none";
    img.style.position = "static";
    img.style.marginTop = "0";
    img.style.marginBottom = "0";

    var descent = div.getBoundingClientRect().height - font.size * 2;
    div.removeChild(img);
    div.innerHTML = "H";
    var ascent = div.getBoundingClientRect().height - descent;
    div.remove();
    return { a: ascent, d: descent};
}

function get_font_lineheight(font) {
    var body = document.body;
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

    div.style.fontFamily = font.family;
    div.style.fontSize = font.size + "px";
    div.style.fontWeight = font.weight;
    div.style.fontStyle = font.style;
    div.style.lineHeight = "normal";

    var div_rect = div.getBoundingClientRect();
    var lineheight = div_rect.height;
    div.remove();
    return lineheight;
}

function get_font_offsets(font) {
    var body = document.body;
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

    div.style.fontFamily = font.family;
    div.style.fontSize = font.size + "px";
    div.style.fontWeight = font.weight;
    div.style.fontStyle = font.style;
    div.style.lineHeight = "10px";
    span.style.fontFamily = font.family;
    span.style.fontSize = font.size + "px";
    span.style.fontWeight = font.weight;
    span.style.fontStyle = font.style;
    span.style.lineHeight = "10px";

    var span_rect = span.getBoundingClientRect();
    var div_rect = div.getBoundingClientRect();
    div.remove();

    return { top: div_rect.top - span_rect.top, bottom: span_rect.bottom - div_rect.top };
}

function get_font(font) {
    if (font.size == 0) return [font.size, font.family, font.weight, font.style, 0, 0, 0, 0, 0];
    var metrics = get_font_metrics(font);
    var offsets = get_font_offsets(font);
    var lineheight = get_font_lineheight(font);
    var offset_const = (10 - (metrics.a + metrics.d))/2;

    return [font.size, font.family, font.weight, font.style,
            metrics.a, metrics.d,
            offset_const + offsets.top,
            offset_const + offsets.bottom - 10,
            lineheight];
}

export function dump_fonts(name, features) {
    var flist : string[] = [];
    var fonts = Object();
    var elt = document.documentElement;
    
    function recurse(elt) {
        if (elt.nodeType === document.ELEMENT_NODE) {
            var fs = cs(elt, "font-size"), ff = cs(elt, "font-family")
            var fw = cs(elt, "font-weight"), fy = cs(elt, "font-style")
            var fname = [fs, ff, fw, fy].join(" ");
            var font = { size: val2px(fs, features),
                         family: ff, weight: fw, style: fy };
            
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
        var struct = get_font(font);
        if (struct[4] < 0) features["font:bad-metrics"] = true;
        if (struct[5] < 0) features["font:bad-metrics"] = true;
        for (var i = 1; i < struct.length; i++) {
            if (typeof struct[i] !== "string") {
                 struct[i] = f2r(struct[i]);
            }
        }
        // Only string-dump the family
        struct[1] = dump_string(struct[1]);
        text += "\n  [" + struct.join(" ") + "]";
    }
    text += ")\n";

    return text;
}
