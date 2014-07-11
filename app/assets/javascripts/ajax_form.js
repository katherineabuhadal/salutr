$(function(){

  var pusher = new Pusher(window.PUSHER);
  var channel = pusher.subscribe(window.CHANNEL);

  channel.bind('new-salute', function(data)  {
    console.log("hi");
    $("#salutes").prepend(data.salute);
  });

  $("#new_salute_form").submit(newSalute);

});

function newSalute(){
  console.log("NEW SALUTE");
  $.post("/salutes", $("#new_salute_form").serialize());
  return false;
};




