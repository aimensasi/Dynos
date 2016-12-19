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
		}else if ($fileBtn.attr('data-parent') == "logo"){
			//hide current cover img
			$logoImage.addClass('hide');
			//show loading cover
			$fileBtn.next().addClass('hide');
			
			$loadingLogo.removeClass('hide');
		}

	});
});