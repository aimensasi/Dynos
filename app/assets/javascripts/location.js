$(document).ready(function(){
	var $markerSchool = $("#school-address");

	if (!navigator.geolocation) {
			$markerSchool.addClass('hide');
			return;	
		}

	$markerSchool.on('click', function(){
		

		getLocation('school',function(position){
			var lat = position["lat"]
			var long = position["long"]	
			$.getJSON( {
		    url  : 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + lat + ',' + long + '&key=AIzaSyCYCMAxjlyxQAwDKs-TB3B258yCcsZc-lY',
		    success : function( data, textStatus ) {
		      console.log( textStatus, data );
		      console.log( textStatus, data.results[0].formatted_address );
		      
		      if ($markerSchool.attr('data-parent') == 'school') {
		      	$('#school-location').val(data.results[0].formatted_address);
		      }else if ($markerSchool.attr('data-parent') == "individual") {
		      	$('#individual-location').val(data.results[0].formatted_address);
		      }
		    },
		    error: function(err){
		    	console.log( err );
		    }
			});
		});
	});

	function getLocation(action, fn){
		navigator.geolocation.getCurrentPosition(function(position) {
			var lat = position.coords.latitude;
			var long = position.coords.longitude;
			console.log(position);
			fn({lat: lat, long: long})
		}, function(err){
			console.log(err);
		});
	}

});

