for (i in taglist) {
    var tag = taglist[i].tag;
    var index = taglist[i].index;
    document.getElementsByTagName(tag)[index].remove();
}