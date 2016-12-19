$(document).ready(function(){
	var $alert = $('.alert');
	if ($alert.length > 0) {
		console.log("Visible");
		setTimeout(function(){
			$alert.css({'opacity': '0', 'top': '-100px'});
		}, 3000);
		
	}else{
		console.log("Not Visible");
	}
});