
function add_element(){
	  	var list = document.getElementById("list");
	  	let list_element = document.createElement('li');
	  	list.appendChild(list_element);
	  	list_element.id = 'element-' + list.getElementsByTagName("li").length;
		list_element.innerHTML = "value-" + list.getElementsByTagName("li").length;
}

add_element();
add_element();
