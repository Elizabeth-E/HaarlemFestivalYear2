
{include file="{$layout}\\header.tpl"}

<body>
<section class="container maincontent">
<main>
	<div class="container">
  
		<h2 class="section-heading">Checkout page</h2>
            <p>Phasellus finibus lorem id feugiat pulvinar. Morbi semper felis eu eros cursus molestie.
            Quisque tellus ex, pulvinar ac tortor in, tristique rhoncus est. Vestibulum interdum elementum ornare. 
            Donec nibh turpis, sollicitudin vitae orci ac, finibus iaculis dui. Nam at ullamcorper ex. Morbi et varius orci,
            non ultrices nisl. Mauris eleifend augue non sapien fringilla ullamcorper. Phasellus sagittis ultricies tellus 
            quis ullamcorper. Etiam posuere nisl dictum volutpat venenatis. Sed mattis egestas libero, ut hendrerit lectus
            semper at. Etiam et commodo erat. Vestibulum nec erat risus. In ac purus in magna dignissim luctus et et magna. 
            Cras porttitor leo at mi varius mollis. Morbi ligula neque, vehicula nec elit sed, malesuada iaculis massa.</p>
            
            <p>Phasellus finibus lorem id feugiat pulvinar. Morbi semper felis eu eros cursus molestie. Quisque tellus ex,
            pulvinar ac tortor in, tristique rhoncus est. Vestibulum interdum elementum ornare. Donec nibh turpis, sollicitudin
            vitae orci ac, finibus iaculis dui. Nam at ullamcorper ex. Morbi et varius orci, non ultrices nisl. Mauris eleifend
            augue non sapien fringilla ullamcorper. Phasellus sagittis ultricies tellus quis ullamcorper. Etiam posuere nisl
                dictum volutpat venenatis. Sed mattis egestas libero, ut hendrerit lectus semper at. Etiam et commodo erat.
                Vestibulum nec erat risus. In ac purus in magna dignissim luctus et et magna. Cras porttitor leo at mi varius 
                mollis. Morbi ligula neque, vehicula nec elit sed, malesuada iaculis massa.</p>

    <button onclick="creditForm()">credit card</button>
    <button onclick="idealForm()">ideal</button>
    <a href="{$www}/checkout/dummy" class="payment">PayPal</a>
    <a href="{$www}/checkout/dummy" class="payment">Bitcoin</a>
	</div>

    <form method="post" id="credit"  action="{$POST_URL}">
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
            <div class="form-group" id="credit_cards">
                <img src="{$www}/img/visa.jpg" id="visa">
                <img src="{$www}/img/mastercard.jpg" id="mastercard">
            </div>
            <div class="form-group" id="pay-now">
                <button type="submit" class="btn btn-default" id="confirm-purchase">Confirm</button>
            </div>
    </form>

    <form method="post" id="ideal"  action="{$POST_URL}">
         <p>Select your bank and click continue</p>
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

        <button type="submit" class="btn btn-default">continue</button>
    </form>

    <script>
        var a = document.getElementById("credit");
        var b = document.getElementById("ideal");

            a.style.display = "block";
            b.style.display = "none";

        function creditForm()
        {
        if (a.style.display === "none") 
        {
            a.style.display = "block";
            b.style.display = "none";
        } 
        }

        function idealForm()
        {
        if (b.style.display === "none") 
        {
            b.style.display = "block";
            a.style.display = "none";
        } 
        }
</script>
</main>
</section>
</body>

{include file="{$layout}\\footer.tpl"}