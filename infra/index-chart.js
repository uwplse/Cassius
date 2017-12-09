width = 740;
height = 200;
margin = 10;
labels = 40;

function add_fields(fields) {
    return (d) => {
        var sum = 0;
        for (var i = 0; i < fields.length; i++) {
            sum += (d[fields[i]] || 0);
        }
        return sum;
    }
}

function draw_class(node, name, data) {
    var g = node
        .attr("width", width + 2 * margin + labels)
        .attr("height", height + 2 * margin + labels)
        .append("g").attr("transform", "translate(" + (margin + labels) + "," + margin + ")");

    var total = d3.max(data, add_fields(["success", "expected", "fail", "error", "timeout", "unsupported"]))

    var x = d3.scaleTime().range([0, width]);
    var y = d3.scaleLinear().range([height, 0]);
    x.domain(d3.extent(data, x => new Date(x[":time"] * 1000)));
    y.domain([0, total]);
    g.append("g").call(d3.axisLeft().scale(y))
    g.append("g").call(d3.axisBottom().scale(x))
        .attr("transform", "translate(0," + height + ")")

    branches = {}
    for (var i = 0; i < data.length; i++) {
        var array = (branches[data[i][":branch"]] || []);
        array.push(data[i]);
        branches[data[i][":branch"]] = array;
    }
    var key = d3.scaleOrdinal(d3.schemeCategory10).domain(Object.keys(branches));

    for (var branch in branches) {
        console.log(name, branch, key(branch))
        if (!branches.hasOwnProperty(branch)) continue;
        var points = branches[branch].map(x => [
            new Date(x[":time"] * 1000),
            add_fields(["success", "expected"])(x)
        ]);
        g.append("g").selectAll("circle")
            .data(points).enter().append("circle")
            .attr("cx", (pt) => x(pt[0]))
            .attr("cy", (pt) => y(pt[1]))
            .attr("r", 2)
            .attr("fill", key(branch))
    }
}

function relevant_data(data) {
    return data[":time"] > new Date() / 1000 - 60*60*24*31;
}

function draw(node, data) {
    for (var i in data) {
        if (!data.hasOwnProperty(i)) continue;
        if (data[i].filter(relevant_data).length > 1) {
            draw_class(node.append("svg").attr("data-suite", i), i, data[i]);
        }
    }
}
