$(document).ready(function(){
	var $loadingCover = $('.loading-cover');
	var $loadingLogo = $('.loading-logo');
	var $coverImage = $('.cover');
	var $logoImage = $('.logo');


	$('.inputfile').on('change', function(){
		var $fileBtn = $(this);	
		var filePath = $fileBtn.val();
		console.log('Cliked');

		if ($fileBtn.attr('data-parent') == "cover") {
			//hide current cover img
			$coverImage.addClass('hide');
			$fileBtn.next().addClass('hide');
			//show loading cover
			$loadingCover.removeClass('hide');
			// make an ajax call to update cover img
			// sendAjaxRequest('/individuals/', );
		}else if ($fileBtn.attr('data-parent') == "logo"){
			//hide current cover img
			$logoImage.addClass('hide');
			//show loading cover
			$fileBtn.next().addClass('hide');
			
			$loadingLogo.removeClass('hide');
		}

	});


	function sendAjaxRequest(url, data){
		$.ajax({
			url: url,
			type: 'PATCH',
			dataType: 'json',
			cache: false,
			data: data,
			success: function(data){
				console.log("Success");
				console.log(data);
			},
			error: function(err){
				console.log("Error");
				console.log(err);
			}
		});
	} //AjaxFunction
});