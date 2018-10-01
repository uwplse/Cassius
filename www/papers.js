
function setup_show_hide_abstracts() {
    var abstracts = document.querySelectorAll(".abstract");
    for (var i = 0; i < abstracts.length; i++) {
        (function(abstract) {
            abstract.style.display = "none";
            var button = document.createElement("a");
            button.href = "#";
            button.classList.add("abstract-link");
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

document.addEventListener("DOMContentLoaded", setup_show_hide_abstracts);
