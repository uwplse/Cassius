function define(name, deps, fn) {
    fn.apply(window, deps.map(function() { return window; }));
}
