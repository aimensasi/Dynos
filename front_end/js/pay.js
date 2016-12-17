var btnUp = document.getElementById("btn-up");
var btnDown = document.getElementById("btn-down");
var ticketCounter = document.getElementById("ticket-counter");
var totalPrice = document.getElementById("total-price");

btnUp.addEventListener('click', function(){
	console.log('Clicked');
	var count = parseInt(ticketCounter.value);
	var price = parseFloat(totalPrice.getAttribute("data-default"));
	var totalPriceText = 0;
	count += 1;

	totalPriceText = count * price;
	ticketCounter.value = count;
	totalPrice.value = totalPriceText;

	console.log("Price: " + price + " Count: " + count + " totalPrice: " + totalPriceText);
});

btnDown.addEventListener('click', function(){
	console.log('Clicked');
	var count = parseInt(ticketCounter.value);
	if (count == 1){return}
	var price = parseFloat(totalPrice.getAttribute("data-default"));
	var totalPriceText = 0;
	count -= 1;

	totalPriceText = count * price;
	ticketCounter.value = count;
	totalPrice.value = totalPriceText;
	
	console.log("Price: " + price + " Count: " + count + " totalPrice: " + totalPriceText);
});

ticketCounter.addEventListener('keyup', function(e){
	if (e.keyCode == 13) {
		var count = parseInt(ticketCounter.value);
		if (count < 1){
			count = 1;
			ticketCounter.value = 1;
		}
		var price = parseFloat(totalPrice.getAttribute("data-default"));
		var totalPriceText = 0;

		totalPriceText = count * price;
		totalPrice.value = totalPriceText;

		console.log("Price: " + price + " Count: " + count + " totalPrice: " + totalPriceText);
	}
});
















