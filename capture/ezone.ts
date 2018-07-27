function val2px(val : string, features : any) {
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

function val2pct(val : string, _ : any) {
    if (val.match(/^[-+0-9.e]+%$/)) {
        return +val.substr(0, val.length - 1);
    } else {
        throw "Error, " + val + " is not a percentage quantity."
    }
}

function val2em(val : string, features : any) {
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

function convert_margin(margin : string, elt : Element) {
    try { return val2px(margin, {}) } catch (e) {}
    try { return val2pct(margin, {}) * elt.clientWidth } catch (e) {}
    try { return val2em(margin, {}) * get_fontsize(elt) } catch (e) {}
    throw "Error weird margin value `" + margin + "`";
}

function get_fontsize(elt : Element) : number {
    var fs = cs(elt, "font-size");
    try { return val2px(fs, {}) } catch (e) {}
    try { return val2pct(fs, {}) * get_fontsize(elt.parentNode as Element) / 100 } catch (e) {}
    try { return val2em(fs, {}) * get_fontsize(elt.parentNode as Element) } catch (e) {}
    throw "Error weird font-size value " + fs;
}

function top_outer(elt : Element) {
    return elt.getBoundingClientRect().top - convert_margin(cs(elt, "margin-top"), elt);
}
function bottom_outer(elt : Element) {
    return elt.getBoundingClientRect().bottom + convert_margin(cs(elt, "margin-bottom"), elt);
}

function is_float(elt : Element) {
    return elt.nodeType === document.ELEMENT_NODE &&
        cs(elt, "float") != "none";
}

function add_feature(box, feature : string) {
    var props = box.props["features"] || []
    props.push(feature)
    box.props["features"] = props;
}

function cs(elt, value) {
    return window.getComputedStyle(elt).getPropertyValue(value);
}

function count_distinct(f, arr1, arr2) {
    var h = {};
    var c = 0;
    for (var i = 0; i < arr1.length; i++) {
        if (!h[f(arr1[i])]) c++;
        h[f(arr1[i])] = true;
    }
    for (var i = 0; i < arr2.length; i++) {
        if (!h[f(arr2[i])]) c++;
        h[f(arr2[i])] = true;
    }
    return c;
}

export var MAX = 0;

export class Ezone {
    mark : number;
    left : Node[];
    right : Node[];
    prev : Node | null;

    constructor() {
        this.left = [];
        this.right = [];
        this.mark = 0;
        this.prev = null;
    }

    add(box) {
        var dir = cs(box, "float");
        var steps = this[dir];
        var y = bottom_outer(box);
        var mark = top_outer(box);
        for (var i = 0; i < steps.length; i++) {
            if (!steps[i]) continue;
            if (bottom_outer(steps[i]) < mark) {
                steps[i] = null;
                continue;
            }
            if (bottom_outer(steps[i]) == y) {
                steps[i] = null;
                continue;
            }
        }
        var i = 0;
        while (i < steps.length) {
            if (steps[i]) i++
            else steps.splice(i, 1);
        }
        steps.push(box);
        this.mark = Math.max(this.mark, mark);
        this.prev = box;
    
        MAX = Math.max(count_distinct(function(x) {return bottom_outer(x)}, this.left, this.right), MAX);
    }

    clone() {
        var x = new Ezone();
        x.left = this.left.slice();
        x.right = this.right.slice();
        x.mark = this.mark;
        x.prev = this.prev;
        return x;
    }
}

export function compute_flt_pointer(box, prev, vbox) {
    box.flt = prev || new Ezone();
    box.vbox = vbox;
    if (box.node && is_float(box.node)) {
        prev = null;
        vbox = null;
        for (var i = 0; i < box.children.length; i++) {
            prev = compute_flt_pointer(box.children[i], prev, vbox);
            vbox = box;
        }
        var out = box.flt.clone();
        out.add(box.node);
        return out;
    } else {
        vbox = null;
        for (var i = 0; i < box.children.length; i++) {
            prev = compute_flt_pointer(box.children[i], prev, vbox);
            vbox = box;
        }
        return prev;
    }
}

export function check_float_registers(box, features) {
    if (box.type === "TEXT") {
        if (box.props.y < box.flt.mark) {
            add_feature(box, "exclusion-zone");
            features["exclusion-zone"] = true;
        }
    }

    for (var i = 0; i < box.children.length; i++) {
        check_float_registers(box.children[i], features);
    }
}

