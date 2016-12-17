$(document).ready(function(){
  var anchor = window.location.hash
  var $event = $("#your-events");
  var $profile = $("#profile");
  var $eventTab = $('a[data-name="your-events"]');
  var $profileTab = $('a[data-name="profile"]');
  console.log(anchor);

  if (anchor != "") {
		if (anchor == "#your-events") {
			$profile.removeClass('active');
			$event.addClass('active');
			if ($profileTab.hasClass('active')) {
				$profileTab.removeClass('active');
			}
			$eventTab.addClass('active');
		}	
  }

});