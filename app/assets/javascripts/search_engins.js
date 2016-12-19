$(document).ready(function(){

	var SCHOOL_URL = '/search_schools';
	var EVENT_URL = '/search_events';

	var $schoolResult = $('.schools-result');
	var $schoolSearch = $('#school-search');
	var $iconSearch = $('#school-icon');
	var $ageRange = $('#age-range');
	var $schoolType = $('.category');

	var $eventSearch = $('#event-search');
	var $eventResult = $('.event-results');
	var $iconSearch = $('#event-icon');


	// Search For School Using Full Text Search and Filters
	$iconSearch.on('click', function(){
		console.log($(this).next().serialize());
		if ($(this).attr('data-parent') == 'school') {
			sendAjaxRequest(SCHOOL_URL, $(this).next().serialize());
		}else{
			sendAjaxRequest(EVENT_URL, $(this).next().serialize());
		}

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
		sendAjaxRequest(SCHOOL_URL, $(this).serialize(), 'school-search');
	});
	// Search For School Using Full Text Search and Filters

	// Search For events Using Full Text Search
	$eventSearch.on('submit', function(e){
		e.preventDefault();
		sendAjaxRequest(EVENT_URL, $(this).serialize(), 'event-search');
	});


	function updateView(data, action){
		if (action == "event-search") {
			$eventResult.empty();
			setTimeout(function(){
				$eventResult.html(data);
			}, 1000);
		}else if (action == "school-search") {
			$schoolResult.empty();
			setTimeout(function(){
				$schoolResult.html(data);
			}, 1000);		
		}
		

	}

	function sendAjaxRequest(url, data, action){
		$.ajax({
			url: url,
			type: 'GET',
			dataType: 'html',
			cache: false,
			data: data,
			success: function(data){
				updateView(data, action);
			},
			error: function(err){
				console.log("Error");
				console.log(err);
			}
		});
	} //AjaxFunction

});
