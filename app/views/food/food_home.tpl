{include file="{$layout}\\header.tpl"}

<html>
<script>
$(document).on('change', '.totalNum', function(){
    var total = 0;
    $('.totalNum').each(function() {
        total += parseInt($(this).val())*10;
    });
    $('#sum').val(total)
});
</script>
	<main>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Food</a></li>
    <li class="breadcrumb-item"><a href="#">Restaurant name</a></li>
    <li class="breadcrumb-item active" aria-current="page">Reservation</li>
  </ol>
</nav>
		<div class="container">
			<h2 class="section-heading text-center ">Reservation Page</h2>
			<p class="text-center"> Reserve your table for €10 deposite (per-person)
the reservation fee will be deduced from the final bill  </p>
		</div>

		 <form method="post" action="{$POST_URL}">

			<div class="form-group  col-md-6 text-right ">
				<label>Number Of Adults</label>
				<br>
		<select class="totalNum">
		<option selected>0</option>
		<option>1</option>
		<option>2 </option>
		<option>3 </option>
		<option>4 </option>
		<option>5 </option>
		<option>6 </option>
		<option>7 </option>
		<option>8 </option>
		<option>9 </option>
		<option>10 </option>
		<option>11 </option>
		<option>12 </option>
		<option>13 </option>
		<option>14 </option>
		<option>15 </option>
		</select>
		</div>

		<div class="form-group  col-md-6">
				<label>Number Of Kids (-12)</label>
				<br>
		<select class="totalNum" >
		<option selected>0</option>
		<option>1</option>
		<option>2 </option>
		<option>3 </option>
		<option>4 </option>
		<option>5 </option>
		<option>6 </option>
		<option>7 </option>
		<option>8 </option>
		<option>9 </option>
		<option>10 </option>
		<option>11 </option>
		<option>12 </option>
		<option>13 </option>
		<option>14 </option>
		<option>15 </option>
		</select>
		</div>

		<div class="form-group  col-md-6 text-right">
				<label>Time</label>
				<br>
				<select class="NumberOfAdults" >
		<option selected>17:00-19:00</option>
		<option>19:00-21:00</option>
		<option>21:00-23:00</option>
		</select>
		</div>

		<div class="form-group  col-md-6 ">
				<label>Date</label>
				<br>
				<select class="NumberOfAdults" >
		<option selected>26-july-2018</option>
		<option>27-july-2018</option>
		<option>28-july-2018</option>
		<option>29-july-2018</option>
		</select>
		</div>


		  <div class="text-center">
          <p><span>55 seats left</span></p>
        </div>
      </div>

 <div class="form-group">
    <textarea name ="comment" class="form-control text-center" rows="7" >Enter your comment here...!!!!</textarea>
  </div>

 <div class="text-center">
        <div class="text ">
          <p><span>Total:<input id="sum" type="text"  disabled='true' size="5"/></span></p>
        </div>
      </div>

<button type="submit" value="submit" class="btn btn-default" align="middle">Add to cart</button>

	</main>
</div>
</html>

{include file="{$layout}\\footer.tpl"}