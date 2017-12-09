width = 740;
height = 200;
margin = 10;
labels = 40;

lookback = 60*60*24*31;

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
    var header = node.append("header");

    var g = node.append("svg")
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

    header.append("ul").selectAll("li")
        .data(Object.keys(branches)).enter().append("li")
        .style("border-left-width", "1em")
        .style("border-left-color", key)
        .text((x) => x);
    header.append("h1").text(name);

    for (var branch in branches) {
        console.log(name, branch, key(branch))
        if (!branches.hasOwnProperty(branch)) continue;
        g.append("g").selectAll("circle")
            .data(branches[branch]).enter().append("circle")
            .attr("cx", (d) => x(new Date(d[":time"] * 1000)))
            .attr("cy", (d) => y(add_fields(["success", "expected"])(d)))
            .attr("r", 5)
            .attr("fill", key(branch))
            .append("title")
            .text((d) => {
                var s = "";
                var keys = Object.keys(d);
                keys.sort();
                for (var i = 0; i < keys.length; i++) {
                    s += keys[i] + ": " + d[keys[i]] + "\n";
                }
                return s;
            });
    }
}

function relevant_data(data) {
    return data[":time"] > new Date() / 1000 - lookback;
}

function draw(node, data) {
    for (var i in data) {
        if (!data.hasOwnProperty(i)) continue;
        var class_data = data[i].filter(relevant_data);
        if (class_data.length > 1) {
            draw_class(node.append("section").attr("data-suite", i), i, class_data);
        }
    }
}
