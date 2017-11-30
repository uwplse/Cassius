
function estimate_scrollbar() {
    var html = document.documentElement;
    if (window.scrollMaxY !== 0) throw "Error: page already has scrollbar!";
    var width = html.clientWidth;
    html.style.height = window.innerHeight * 10 + "px";
    return width - html.clientWidth;
}

