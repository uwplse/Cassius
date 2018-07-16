function setup_show_hide_abstracts() {
    var abstracts = document.querySelectorAll(".abstract");
    for (var i = 0; i < abstracts.length; i++) {
        (function(abstract) {
            abstract.style.display = "none";
            var button = document.createElement("a");
            button.href = "#";
            button.innerText = "Show abstract";
            button.addEventListener("click", function(evt) {
                abstract.style.display = "block";
                abstract.parentNode.removeChild(button);
                evt.preventDefault();
            });
            abstract.parentNode.insertBefore(button, abstract);
        })(abstracts[i]);
    }
}
