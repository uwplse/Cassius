for (i in TAGLIST) {
    var tag = TAGLIST[i].tag;
    var index = TAGLIST[i].index;
    document.getElementsByTagName(tag)[index].remove();
}