$(document).ready(function(){
	var $loadingCover = $('#loading-cover');
	var $loadingLogo = $('#loading-logo');
	var $coverImage = $('#cover');
	var $logoImage = $('#logo');
	var $coverbtn = $('.cover-btn');
	var $logoBtn = $('.logo-btn');

	$('.inputfile').on('change', function(){
		var $fileBtn = $(this);	
		var filePath = $fileBtn.val();

		if ($fileBtn.attr('data-parent') == "cover") {
			
			// $coverImage.attr('src', "#");
			$coverbtn.addClass('hide');
			$loadingCover.removeClass('hide');
			$coverImage.addClass('hide');

			
			$('#cover-img').submit();
		}else if ($fileBtn.attr('data-parent') == "logo"){

			$logoImage.addClass('hide');
			//show loading cover
			$logoBtn.addClass('hide');
			
			$loadingLogo.removeClass('hide');
			$('#logo-img').submit();
		}
	});

	$("#cover-img").bind("ajax:success", function(e, data, status, xhr){
		res = JSON.parse(xhr.responseText);
		$coverImage.attr("src", res.bg_img);
		
		setTimeout(function(){
			$coverbtn.removeClass('hide');
			$coverImage.removeClass('hide');
			$loadingCover.addClass('hide');	
		}, 500);
		
			
	});	
	$("#logo-img").bind("ajax:success", function(e, data, status, xhr){
		res = JSON.parse(xhr.responseText);
		$logoImage.attr("src", res.logo);
		
		setTimeout(function(){
			$logoBtn.removeClass('hide');
			$logoImage.removeClass('hide');
			$loadingLogo.addClass('hide');	
		}, 500);
		
			
	});	
});







	// function getPosition(string, subString, index) {
	// 		var pathname = window.location.pathname;
	// 		var url = pathname.substring(0, getPosition(pathname, '/', 3));
	//    return string.split(subString, index).join(subString).length;
	// }