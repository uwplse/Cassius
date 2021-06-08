function define(name, deps, fn) {
    fn.apply(this, deps.map(function() { return this; }));
}
