click_event = new CustomEvent('click');
add = document.querySelector('#add');
for(i=0; i<50; i++) {
  add.dispatchEvent(click_event);
}
