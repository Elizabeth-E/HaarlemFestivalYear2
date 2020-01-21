
{include file="{$layout}\\header.tpl"}
<main>
<section class="container jazz">
	<h1>Checkout Page</h1>
    <div class = "row">
        <div class = "col-lg-3">
            <button class="btn btn-lg jazzhome" onclick="creditForm()">credit card</button>
        </div>
        <div class = "col-lg-3">
            <button class="btn btn-lg jazzhome" onclick="idealForm()">ideal</button>
        </div>
        <div class = "col-lg-3">
            <button class="btn btn-lg jazzhome" onclick="paypalForm()">PayPal</button>
        </div>
        <div class = "col-lg-3">
            <button class="btn btn-lg jazzhome" >Bitcoin</button>
        </div>
    </div>
    <div class = "row">
    <form class = "col-lg-6" method="post" id="credit"  action="{$POST_URL}">
    <h3>Enter Information for Ticket</h3>
            <div class="form-group owner">
                <label for="Name on card">First Name</label>
                <input type="text" class="form-control" id="name on card">
            </div>
            <div class="form-group owner">
                <label for="Name on card">Last Name</label>
                <input type="text" class="form-control" id="name on card">
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Email address</label>
              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <h3>Enter Card Information</h3>
            <div class="form-group owner">
                <label for="Name on card">Name on Card</label>
                <input type="text" class="form-control" id="name on card">
            </div>
             <div class="form-group" id="card number">
                <label for="card number">Card Number</label>
                <input type="text" class="form-control" id="card number">
            </div>
            <div class="form-group CVV">
                <label for="cvv">CVV</label>
                <input type="text" class="form-control" id="cvv">
            </div>
            <div class="form-group">
				<label for="expiration date">Expiration Date</label>
                <input placeholder="MM/YY" type="text" class="form-control" name="Expiration Date" id="expiration date">
			</div>
            <div class="form-group" id="pay-now">
                <button type="submit" class="btn btn-lg jazz" id="confirm-purchase">Confirm</button>
            </div>
    </form>

    <form class = "col-lg-6" method="post" id="ideal"  action="{$POST_URL}">
    <h3>Enter Information for Ticket</h3>
            <div class="form-group owner">
                <label for="Name on card">First Name</label>
                <input type="text" class="form-control" id="name on card">
            </div>
            <div class="form-group owner">
                <label for="Name on card">Last Name</label>
                <input type="text" class="form-control" id="name on card">
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Email address</label>
              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
         <h3>Select your bank and click continue</h3>
            <div class="idealpulldown">
                <div class="pulldown_form">
                    <label class="pulldown_form">
                        <select name="idealbank" id="iidealbank" onchange="" class="pulldown_form">
                            <option value="ABNANL2A" class="pulldown">ABN AMRO</option>
                            <option value="ASNBNL21" class="pulldown">ASN Bank</option>
                            <option value="BUNQNL2A" class="pulldown">bunq</option>
                            <option value="HANDNL2A" class="pulldown">Handelsbanken</option>
                            <option value="INGBNL2A" class="pulldown">ING</option>
                            <option value="KNABNL2H" class="pulldown">Knab</option>
                            <option value="MOYONL21" class="pulldown">Moneyou</option>
                            <option value="RABONL2U" class="pulldown">Rabobank</option>
                            <option value="RBRBNL21" class="pulldown">RegioBank</option>
                            <option value="SNSBNL2A" class="pulldown">SNS</option>
                            <option value="TRIONL2U" class="pulldown">Triodos Bank</option>
                            <option value="FVLBNL22" class="pulldown">van Lanschot</option>
                        </select>
                    </label>
                </div>                        
            </div>

        <button type="submit" class="btn btn-lg jazz">continue</button>
    </form>

<form class = "col-lg-6" method="post" id="paypal"  action="{$POST_URL}">
    <h3>Enter Information for Ticket</h3>
            <div class="form-group owner">
                <label for="Name on card">First Name</label>
                <input type="text" class="form-control" id="firstname">
            </div>
            <div class="form-group owner">
                <label for="Name on card">Last Name</label>
                <input type="text" class="form-control" id="lastname">
            </div>
            <div class="form-group">
              <label for="email123">Email address</label>
              <input type="email" class="form-control" id="email123" aria-describedby="emailHelp" placeholder="Enter email">
              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
                      <!-- Remember me -->
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="paypal-checked">
            <label class="form-check-label" for="paypal-checked">Remember me</label>
          </div>
        
            <div class = "paypal">
            <div id="paypal-button" ></div>
            </div>
    </div>
    </form>

</section>

 <script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script>
var totalAmount = parseFloat('{$totalPayment}').toFixed(2);
let url = '{$www}/checkout/process_order';
{literal}
$('#paypal-checked').change(function() {
    if ( ! this.checked) {
        alert('not checked');
    }

    let data = {
        firstName: $('#firstname').val(),
        lastName: $('#lastname').val(),
        email: $('#email123').val(),
    };
    
    $.post(url, data, function(response) { 
        console.log(response);
    });

});
  paypal.Button.render({
    // Configure environment
    env: 'sandbox',
    client: {
      sandbox: 'demo_sandbox_client_id',
      production: 'demo_production_client_id'
    },
    // Customize button (optional)
    locale: 'en_US',
    style: {
      size: 'large',
      color: 'black',
      shape: 'rect',
    },

    // Enable Pay Now checkout flow (optional)
    commit: true,

    // Set up a payment
    payment: function(data, actions) {
      return actions.payment.create({
        transactions: [{
          amount: {
            total: totalAmount,
            currency: 'EUR'
          }
        }]
      });
    },
    // Execute the payment
    onAuthorize: function(data, actions) {
      return actions.payment.execute().then(function() {
        // Show a confirmation message to the buyer
        window.alert('Thank you for your purchase!');
      });
    }
  }, '#paypal-button');
{/literal}
</script>


<script>
        var a = document.getElementById("credit");
        var b = document.getElementById("ideal");
        var c = document.getElementById("paypal");

            a.style.display = "block";
            b.style.display = "none";
            c.style.display = "none";

        function creditForm()
        {
        if (a.style.display === "none") 
        {
            a.style.display = "block";
            b.style.display = "none";
            c.style.display = "none";
        } 
        }

        function idealForm()
        {
        if (b.style.display === "none") 
        {
            b.style.display = "block";
            a.style.display = "none";
            c.style.display = "none";
        } 
        }

        function paypalForm()
        {
        if (c.style.display === "none") 
        {
            c.style.display = "block";
            b.style.display = "none";
            a.style.display = "none";
        } 
        }
</script>

</main>

{include file="{$layout}\\footer.tpl"}