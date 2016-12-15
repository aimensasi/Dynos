var form = document.querySelector('#checkout-form');
var submit = document.querySelector('input[type="submit"]');
var clientToken = form.getAttribute('data_token');

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
        'font-size': '14pt'
      },
      'input.invalid': {
        'color': 'red'
      },
      'input.valid': {
        'color': 'green'
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
        form.submit();
      });
    }, false);
  });
});

$(document).ready(function(){

 $("#tickets_count").on("input", function(){
 		var ticket_count = $(this).val();
 		var price = $(".price_per_ticket").text(); 

 		sum = parseInt(ticket_count) * parseFloat(price);
 		
 		$(".total_price").text(sum);
 		$("#amount").val(sum);
	});

});
