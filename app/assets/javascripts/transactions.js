var form = document.querySelector('#checkout-form');
var submit = document.querySelector('input[type="submit"]');
var clientToken = form.getAttribute('data_token');


var btnUp = document.getElementById("btn-up");
var btnDown = document.getElementById("btn-down");
var ticketCounter = document.getElementById("ticket-counter");
var totalPrice = document.getElementById("total-price");


braintree.client.create({
  authorization: clientToken
}, function (clientErr, clientInstance) {
  if (clientErr) {
    // Handle error in client creation
    return;
  }

  braintree.hostedFields.create({
    client: clientInstance,
    styles: {
      'input': {
        'font-size': '14pt',
        'color': 'rgba(0, 132, 139, .7)'
      },
      'input.invalid': {
        'color': '#ff5a5f'
      },
      'input.valid': {
        'color': '#00848b'
      }
    },
    fields: {
      number: {
        selector: '#card-number',
        placeholder: '4111 1111 1111 1111'
      },
      cvv: {
        selector: '#cvv',
        placeholder: '123'
      },
      expirationDate: {
        selector: '#expiration-date',
        placeholder: '10/2019'
      }
    }
  }, function (hostedFieldsErr, hostedFieldsInstance) {
    if (hostedFieldsErr) {
      // Handle error in Hosted Fields creation
      return;
    }

    submit.removeAttribute('disabled');

    form.addEventListener('submit', function (event) {
      event.preventDefault();

      hostedFieldsInstance.tokenize(function (tokenizeErr, payload) {
        if (tokenizeErr) {
          // Handle error in Hosted Fields tokenization
          return;
        }

        // Put `payload.nonce` into the `payment-method-nonce` input, and then
        // submit the form. Alternatively, you could send the nonce to your server
        // with AJAX.
        document.querySelector('input[name="payment-method-nonce"]').value = payload.nonce;
        totalPrice.removeAttribute('disabled');
        form.submit();
      });
    }, false);
  });
});



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


















