let n = +location.hash.substr(1);
let event = new CustomEvent('click');
let elt = document.querySelector('#click');
for (let i = 0; i < n; i++) {
    window.iteration = i;
    elt.dispatchEvent(event);
}
