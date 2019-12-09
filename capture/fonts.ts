var APP_PIXEL_TO_PIXELS = 60; // See mozilla/gfx/src/nsCoord.h:18--25 in Firefox source
var DIVISORS : number[] = [];

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

    throw "Insufficiently many divisors!";
}

function dump_string(s) {
    return '"' + s.replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '"';
}

function cs(elt, value) {return window.getComputedStyle(elt).getPropertyValue(value);}

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

function is_comment(elt) {return elt.nodeType == document.COMMENT_NODE;}

// Start of real stuff

function get_font_metrics(font) {
    var body = document.body;
    var div = document.createElement("CassiusBlock");
    div.innerHTML = "Hxy";
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

    var descent = div.getBoundingClientRect().height - font.size * 2;
    div.removeChild(img);
    var ascent = div.getBoundingClientRect().height - descent;
    div.appendChild(img);
    //body.removeChild(div);
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
    body.removeChild(div);
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
    body.removeChild(div);

    return { top: div_rect.top - span_rect.top, bottom: span_rect.bottom - div_rect.top };
}

function get_font_metrics(font) {
    if (font.size == 0) return [font.size, font.family, font.weight, font.style, 0, 0, 0, 0, 0];
    var metrics = get_font_metrics(font);
    var offsets = get_font_offsets(font);
    var lineheight = get_font_lineheight(font);
    var offset_const = (10 - (metrics.a + metrics.b))/2;

    return [font.size, font.family, font.weight, font.style,
            metrics.a, metrics.b,
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
        var metrics = get_font_metrics(font);
        for (var i = 1; i < metrics.length; i++) {
             if (typeof metrics[i] !== "string") {
                 metrics[i] = f2r(metrics[i]);
             } else {
                 metrics[i] = dump_string(metrics[i]);
             }
        }
        text += "\n  [" + metrics.join(" ") + "]";
    }
    text += ")";

    return text;
}
