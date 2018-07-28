
function estimate_scrollbar() {
    var html = document.documentElement;
    if (document.documentElement.scrollHeight != document.documentElement.clientHeight)
        throw "Error: page already has scrollbar!";
    var width = html.clientWidth;
    html.style.height = window.innerHeight * 10 + "px";
    return width - html.clientWidth;
}

