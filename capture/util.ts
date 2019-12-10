
const APP_PIXEL_TO_PIXELS = 60; // See mozilla/gfx/src/nsCoord.h:18--25 in Firefox source
export const MIN_LENGTH = 1/APP_PIXEL_TO_PIXELS;

var DIVISORS : number[] = [];


for (var i = 1; i * i < APP_PIXEL_TO_PIXELS; i++) {
    if (APP_PIXEL_TO_PIXELS % i == 0) {
        DIVISORS.push(i);
        DIVISORS.push(APP_PIXEL_TO_PIXELS / i);
    }
}

DIVISORS.sort(function(a, b) { return a - b; });
DIVISORS.reverse();

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

export function f2r(x) {
    var out = f2q(x);
    if (out.denom == 1) {
        return "" + out.num;
    } else if (out.denom == 2 || out.denom == 5 || out.denom == 10) {
        return "" + (out.num / out.denom);
    } else {
        return "(/ " + out.num + " " + out.denom + ")";
    }
}

export function dump_string(s) {
    return '"' + s.replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '"';
}

export function cs(elt, value) {return window.getComputedStyle(elt).getPropertyValue(value);}

export function val2px(val, features) {
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

export function val2pct(val : string, _) {
    if (val.match(/^[-+0-9.e]+%$/)) {
        return +val.substr(0, val.length - 1);
    } else {
        throw "Error, " + val + " is not a percentage quantity."
    }
}

export function val2em(val, features) {
    if (val.match(/^[-+0-9.e]+em$/)) {
        return +val.substr(0, val.length - 2);
    } else if (val.match(/^[-+0-9.e]+rem$/)) {
        return +val.substr(0, val.length - 3);
    } else if (val.match(/^-?[-+0-9.e]+ex$/)) {
        features["unit:ex"] = true;
        return +val.substr(0, val.length - 2) / 16 * 9;
    } else {
        throw "Error, " + val + " is not a em quantity."
    }
}


export function is_comment(elt) {return elt.nodeType == document.COMMENT_NODE;}

