$(document).ready(function(){

	$('.age-range').jRange({
    from: 2,
    to: 19,
    step: 1,
    scale: ['From', 'To'],
    format: '%s',
    width: 900,
    showLabels: true,
    isRange : true,
    snap: true
	});	

	$('.custom-checkbox').prop('indeterminate', false);


});

 

