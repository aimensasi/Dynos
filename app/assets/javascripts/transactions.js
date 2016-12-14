
$(document).ready(function(){
 $(".tickets_count").change(function(){

      ticket_count = document.getElementsByClassName("tickets_count");
      price = document.getElementsByClassName("price");
      sum = document.getElementsByClassName("total_price");
      sum.total_price.value = ( parseInt(ticket_count.tickets_count.value) * parseFloat(price.price.value));

    })

});
