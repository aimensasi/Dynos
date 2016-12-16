$(document).ready(function(){
	var SCHOOL_URL = '/search_schools';
	var $schoolResult = $('.schools-result');
	var $schoolSearch = $('#school-search');
	var $iconSearch = $('#search-icon');
	// var $eventSearch = $('#event-search');
	var $ageRange = $('#age-range');
	var $schoolType = $('.category');



	// Search For School Using Full Text Search
	$iconSearch.on('click', function(){
		console.log($(this).next().serialize());
		sendAjaxRequest('/search_schools', $(this).next().serialize());
	});
	$schoolSearch.on('submit', function(e){
		e.preventDefault()
		console.log($(this).serialize());
		sendAjaxRequest(SCHOOL_URL, $(this).serialize());
	});

	$ageRange.on('change', function(){
		var age = $(this).val().split(',');
		var minAge = age[0];
		var maxAge = age[1];
		console.log("Changed" + minAge + maxAge);
		sendAjaxRequest(SCHOOL_URL, {min_age: minAge, max_age: maxAge})
	});

	$schoolType.on('change', function(){
		console.log("Changed" + $(this).serialize());
		sendAjaxRequest(SCHOOL_URL, $(this).serialize());
	});

	
	function updateView(data){
		$schoolResult.empty();
		setTimeout(function(){ 
			$schoolResult.html(data);
		}, 1000);
		
	}

	function sendAjaxRequest(url, data){
		$.ajax({
			url: url,
			type: 'GET',
			dataType: 'html',
			cache: false,
			data: data,
			success: function(data){
				console.log("Success");
				console.log(data);
				updateView(data);
			},
			error: function(err){
				console.log("Error");
				console.log(err);
			}
		});
	} //AjaxFunction

});
