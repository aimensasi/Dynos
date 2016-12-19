$(document).ready(function(){

	const SCHOOL_URL = '/search_schools';
	const EVENT_URL = '/search_events';
	const SCHOOL_TYPE = 'school-search';
	const EVENT_TYPE = 'event-search';

	var $schoolResult = $('.schools-result');
	var $schoolSearch = $('#school-search');
	var $iconSearch = $('#school-icon');
	var $ageRange = $('#age-range');
	var $schoolType = $('.category');

	var $eventSearch = $('#event-search');
	var $eventResult = $('.event-results');
	var $iconSearch = $('#event-icon');
	var $resultCover = $('.result-cover');


	// Search For School Using Full Text Search and Filters
	$iconSearch.on('click', function(){
		console.log($(this).next().serialize());
		if ($(this).attr('data-parent') == 'school') {
			sendAjaxRequest(SCHOOL_URL, $(this).next().serialize(), SCHOOL_TYPE);
		}else{
			sendAjaxRequest(EVENT_URL, $(this).next().serialize(), EVENT_TYPE);
		}

	});
	$schoolSearch.on('submit', function(e){
		e.preventDefault()
		console.log($(this).serialize());
		sendAjaxRequest(SCHOOL_URL, $(this).serialize(), SCHOOL_TYPE);
	});

	$ageRange.on('change', function(){
		var age = $(this).val().split(',');
		var minAge = age[0];
		var maxAge = age[1];
		console.log("Changed" + minAge + maxAge);
		sendAjaxRequest(SCHOOL_URL, {min_age: minAge, max_age: maxAge}, SCHOOL_TYPE)
	});

	$schoolType.on('change', function(){
		console.log("Changed" + $(this).serialize());
		sendAjaxRequest(SCHOOL_URL, $(this).serialize(), SCHOOL_TYPE);
	});
	// Search For School Using Full Text Search and Filters

	// Search For events Using Full Text Search
	$eventSearch.on('submit', function(e){
		e.preventDefault();
		sendAjaxRequest(EVENT_URL, $(this).serialize(), EVENT_TYPE);
	});


	function updateView(data, action){
		setTimeout(function(){
			console.log("In");
			$resultCover.addClass('hide');
			if (action == EVENT_TYPE) {
				$eventResult.html(data);
			}else if (action == SCHOOL_TYPE) {
				$schoolResult.html(data);
			}
		}, 1000);
	}

	function sendAjaxRequest(url, data, action){
		if (action == SCHOOL_TYPE) {
			$schoolResult.empty();
		}else{
			$eventResult.empty();
		}
		$resultCover.removeClass('hide');

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
