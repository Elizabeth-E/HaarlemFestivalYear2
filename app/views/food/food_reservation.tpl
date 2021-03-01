{include file="{$layout}\\header.tpl"}

<html>
<script>
function calcVals() {
  var adults = document.getElementById("no_of_adults");
  var kids = document.getElementById("no_of_kids");
  var selFrst = adults.options[adults.selectedIndex].value;
  var selScnd = kids.options[kids.selectedIndex].value;

  var totalCal = +selFrst + +selScnd;
  var sum = totalCal * 10;
   document.getElementById("total_payment").value = sum;
   document.getElementById("total_amount").value = document.getElementById("total_payment").value;

}
</script>
	<main>

<section class=night-page>
    <section name=link-area>
        <a href="{$www}" class=link>Haarlem Festival</a>
        <p class=link-space>></p>
        <a href="{$www}/food/" class=link>Haarlem Food</a>
        <p class=link-space>></p>
        <p href="{$www}/food/foodReservation/{$RestaurantName}" class=link> {$RestaurantName} </p>
        <p class=link-space>></p>
        <p class=link-current>Reservation</p>
    </section>

		<div class="container">
			<h2 class="section-heading text-center ">Reservation Page</h2>
			<p class="text-center"> Reserve your table for €10 deposite (per-person)
			the reservation fee will be deduced from the final bill  </p>
		</div>

<div class="reservation_form">

		 <form name="reservation" method=POST >
			<div class="form-row">
                  <div class="col">
					<label>Number Of Adults</label>
					<br>
					<select  name=no_of_adults id="no_of_adults" class="totalNum form-control" onchange="calcVals()">
						<option Selected>Amount of Adults</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
					</select>
				</div>
			</div>

		<div class="col">
				<label>Number Of Kids (under 12)</label>
				<br>
					<select  name=no_of_kids id="no_of_kids"  class="totalNum form-control" onchange="calcVals()" >
		 				<option value="">Amount of Kids</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
					</select>
		</div>

		<div class="form-row">
                <div class="col">
					<label>Time</label>
					<br>
					<select name=hidden_time class="NumberOfAdults form-control" >
					<option selected>17:00-19:00</option>
					<option>19:00-21:00</option>
					<option>21:00-23:00</option>
					</select>
		</div>
		</div>

		<div class="col">
			<label>Date</label>
			<br>
			<select name=hidden_date class="NumberOfAdults form-control" >
				<option selected>26-july-2018</option>
				<option>27-july-2018</option>
				<option>28-july-2018</option>
				<option>29-july-2018</option>
			</select>
		</div>
			
 		<div class="form-group">
   			 <textarea  name ="hidden_comment" class="form-control" rows="7" >Enter your comment here...!!!!</textarea>
  		</div>

 <div class="text-center">
        <div class="text ">
			<input type=hidden name=hidden_total_payment id="total_amount">
         	 <p><span>Total: <input disabled type=text name=hidden_total_payment id="total_payment" value='{number_format((float)print_r(0, true), 2, '.', '')}'></span></p>
			 
			<br>
			<input type="hidden" name="hidden_event_name" value='Haarle Food-{$RestaurantName}'>
			<button type="submit" name="add_ticket" class="btn">Add To Cart</button>
        </div>
 </div>
</form>
</div>

	</main>
</div>
</html>

<style>
/*Food Reservation*/
.reservation_form {
        margin: 0 200px 0 200px;
        padding: 25px 0 69px;
        position: relative;
    }
    .reservation_form label {
        font-size: 24px;
    }
    .reservation_form select, .form-group input, .form-group textarea .text-center text {
        height: 50%;
        font-size: 22px;
        border-radius: 0;
        border: 1px solid;
    }
  
    .reservation_form .form-group textarea {
        height: 120px;
    }
    .reservation_form div.col {
        margin-bottom: 30px;
    }
    .reservation_form button {
        width: 300px;
        height: 63px;
        font-size: 25px;
        color: black;
        border-radius: 0;      
        background-color: #ED7D22;
        position: relative;
    }

    </style>


