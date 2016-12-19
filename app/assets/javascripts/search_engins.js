$(document).ready(function(){

	var SCHOOL_URL = '/search_schools';
	var EVENT_URL = '/search_events';

	var $schoolResult = $('.schools-result');
	var $schoolSearch = $('#school-search');
	var $iconSearch = $('.search-icon');
	var $ageRange = $('#age-range');
	var $schoolType = $('.category');

	var $eventSearch = $('#event-search');



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
		sendAjaxRequest(SCHOOL_URL, $(this).serialize());
	});
	// Search For School Using Full Text Search and Filters

	// Search For events Using Full Text Search



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
