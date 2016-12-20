$(document).ready(function(){
	const SCHOOL_URL = '/';
	if ("geolocation" in navigator) {
	  /* geolocation is available */
	  console.log("Found It");
	  navigator.geolocation.getCurrentPosition(function(position) {
	  	var lat = position.coords.latitude;
	  	var long = position.coords.longitude;
	  	// (34.140813, -118.10)
	  	lat = 34.140813
	  	long = -118.10
	  	console.log(lat, long);

	  	$.ajax({
	  		url: SCHOOL_URL,
	  		type: 'get',
	  		dataType: 'html',
	  		data: {'lat': lat, 'long': long},
	  		success: function(data){
	  			// console.log(JSON.parse(data).length);
	  			try {
	  			  json = $.parseJSON(data);
	  			} catch (e) {
	  			    // not json
	  			  console.log(e);
	  			  $('.school-index').empty();
	  			  $('.school-index').html(data);
	  			}
	  		},
	  		error: function(err){
	  			console.log(err);
	  		}
	  	});
	    
	  });
	} else {
	  /* geolocation IS NOT available */
	  console.log("Somthing Wrong");
	}

});