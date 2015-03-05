$(document).ready(function(){
	
	$("form.new_group").hide();

	$("#add-new-group").on("click", function(){
		$("form.new_group").show();
		$("#groups").hide();
	});

  $("form.edit_user").hide();

  $("#edit-user").on("click", function(){
    $("form.edit_user").show();
    $("#profile").hide();
    $("#edit-user").hide();
  });
  
  $(".btn-cancel").on("click", function(){    
    $("#profile").show();
    $("#edit-user").show();
    $("form.edit_user").hide();
  })

});

      // function initialize() {
      //   var mapCanvas = document.getElementById('map-canvas');
      //   var mapOptions = {
      //     center: new google.maps.LatLng(44.5403, -78.5463),
      //     zoom: 8,
      //     mapTypeId: google.maps.MapTypeId.ROADMAP
      //   }
      //   var map = new google.maps.Map(mapCanvas, mapOptions)
      // }
      // google.maps.event.addDomListener(window, 'load', initialize);
