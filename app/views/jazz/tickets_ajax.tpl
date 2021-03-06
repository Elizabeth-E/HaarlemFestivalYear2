<ol class="breadcrumb">
	<li><a href="{$www}">Haarlem Festival</a></li>
	<li><a href="{$www}/Jazz">Haarlem Jazz</a></li>
	<li><a href="#" class="active">Tickets</a></li>
</ol>

<section>
	<h1>Tickets</h1>
	<section>
		<h2>All-Access Pass</h2>
<div class="row">
		<div class="container col-lg-3">
			<div class="all-access">
				<p class="allpass" data-day="Thursday"> Thursday</p>
				<p class="allpass"> 26th July</p>
				<p class="allpass"> Pass</p>
				<p class="allpass" data-price="35"> &euro;35,-</p>
				<button type="button" class="btn btn-lg jazz" data-ticketid="6" data-ticket-type="all-access" data-toggle="modal" data-target="#basicExampleModal">Select Ticket </button>
				<p class="fineprint"> Access to all events on this day</p>
			</div>
		</div>
		<div class="container col-lg-3">
			<div class="all-access">
				<p class="allpass" data-day="Friday"> Friday</p>
				<p class="allpass"> 27th July</p>
				<p class="allpass"> Pass</p>
				<p class="allpass" data-price="35"> &euro;35,-</p>
				<button type="button" class="btn btn-lg jazz" data-ticketid="6" data-ticket-type="all-access" data-toggle="modal" data-target="#basicExampleModal">Select Ticket </button>
				<p class="fineprint"> Access to all events on this day</p>
			</div>
		</div>
		<div class="container col-lg-3">
			<div class="all-access">
				<p class="allpass" data-day="Saturday"> Saturday</p>
				<p class="allpass"> 28th July</p>
				<p class="allpass"> Pass</p>
				<p class="allpass" data-price="35"> &euro;35,-</p>
				<button type="button" class="btn btn-lg jazz" data-ticketid="6" data-ticket-type="all-access" data-toggle="modal" data-target="#basicExampleModal">Select Ticket </button>
				<p class="fineprint"> Access to all events on this day</p>
			</div>
		</div>
		<div class="container col-lg-3">
			<div class="all-access">
				<p class="allpass"> All Access</p>
				<p class="allpass"> Pass</p>
				<p class="allpass" data-day="All Weekend"> Thu, Fri, Sat</p>
				<p class="allpass" data-price="80"> &euro;80,-</p>
				<button type="button" class="btn btn-lg jazz" data-ticketid="3" data-ticket-type="all-access" data-toggle="modal" data-target="#basicExampleModal">Select Ticket </button>
				<p class="fineprint"> Access to all events on this day</p>
			</div>
		</div>
</div>
	</section>
	<section>
		<h2>Single Tickets</h2>
		{foreach from=$eventList key=date item=events}
		<section>
			<h3 data-day="{$date}" class="datesection">{$date}</h3>
			{foreach from=$eventList[$date] item=event}
			<div class="container jazzticket col-lg-12">
			<img data-img="{$event.picture|escape}" data-ticketid="{$event.ticketid}" src="{$www}{$event.picture|escape}" alt="{$event.artist|escape}" class="ticketpicture col-lg-2">
				<div class="jazzticket col-lg-8">
					<p class="jazzticketartist" data-artist="{$event.artist|escape}">{$event.artist|escape}</p>
					<p class="jazzticketp" data-location="{$event.location|escape}-{$event.hall|escape}" id="artist-location">{$event.location|escape}-{$event.hall|escape}</p>
					<p class="jazzticketp" data-time="{$event.time}" id="artist-time">{$event.time}</p>
				</div>
				<div class="jazzticket col-lg-2">
					<p class="jazzticketp" data-price="{$event.price}">&euro; {$event.price}</p>
					<button type="button" class="btn btn-lg jazz" data-ticket-type="event" data-toggle="modal" data-target="#basicExampleModal">Select Ticket</button>
				</div>
			</div>
			{/foreach}
		<section>
		{/foreach}
	</section>
</section>

<!-- Modal -->
<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3>Add Tickets for &quot;<span id="artist-name"><!-- Filled by JS --></span>&quot;</h3>
			</div>
			<div class="modal-body">
				<div class="alert alert-danger alert-dismissible" role="alert" id="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<strong id="alert-type"></strong> <span id="alert-message"></span>
				</div>
				
				<div class="row">
					<div class="col-xs-8">
						<div class="row">
							<section class="regular-ticket-selection">
								<p id="night-ticket-name">Regular Ticket(s) - &euro; <span id="artist-price"><!-- Filled by JS --></span></span></p>             
								<button id="night-ticket-button-minus-bottom">-</button>
								<input type="text" id="regular_ticketx" name="regular" value="0" disabled>
								<button id="night-ticket-button-plus">+</button>
							</section>
						</div>
						<div class="row" style="border-top: 1px solid #000; padding-top: 1em;">
							<p>Total Amount &euro;: <span id="total-amount">0.0</span></p>
						</div>
					</div>
					<div class="col-xs-4">
						<p class="fineprintmodal"> Items added to cart are reserved for 24 hours</p>
						<button type="button" class="btn btn-lg jazz" id="add-to-cart">Add to Cart</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
{literal}
$('#alert').hide();

let ticketPrice = 0.0;

// Add ticket to order
$('#night-ticket-button-plus').click(function(e) {
	// Update tickets
	let $ticketElm = $('#regular_ticketx');
	let ticketCount = $ticketElm.val();

	ticketCount = parseInt(ticketCount) + 1;
	$ticketElm.val(ticketCount.toString());

	// Update total price
	let $priceElm = $('#total-amount');
	let price = $priceElm.text();

	price = parseInt(price) + ticketPrice;
	$priceElm.text(price.toString());
});

// Subtract ticket from order
$('#night-ticket-button-minus-bottom').click(function(e) {
	// Update tickets
	let $ticketElm = $('#regular_ticketx');
	let ticketCount = $ticketElm.val();
	
	if (ticketCount > 0) {
		ticketCount = parseInt(ticketCount) - 1;
		$ticketElm.val(ticketCount.toString());

		// Update total price
		let $priceElm = $('#total-amount');
		let price = $priceElm.text();

		price = parseInt(price) - ticketPrice;
		$priceElm.text(price.toString());
	}
});

// When add EVENT ticket is selected
$('[data-ticket-type="event"]').click(function(e) {
	// Reset ticket values
	$('#regular_ticketx').val('0');
	$('#total-amount').text('0.0');
	$('#alert').hide();

	// Clear old data
	$('#artist-name').text("");
	$('#artist-price').text("0");
	ticketPrice = 0.0;

	// Update modal with ticket data
	let $ticketElm = $(this).parent().parent();
	window.ticket = {
		ticketid: $ticketElm.find('[data-ticketid]').data('ticketid'),
		event: 'Haarlem Jazz - ' + $ticketElm.find('[data-artist]').data('artist'),
		price: $ticketElm.find('[data-price]').data('price'),
		name: $ticketElm.find('[data-artist]').data('artist'),
		day: $ticketElm.parent().find('[data-day]').data('day'),
		location: $ticketElm.find('[data-location]').data('location'),
		time: $ticketElm.find('[data-time]').data('time'),
		img: $ticketElm.find('[data-img]').data('img'),
		type: 'jazz'
	};

	$('#artist-name').text(window.ticket.name);
	$('#artist-price').text(window.ticket.price);

	ticketPrice = parseInt(window.ticket.price);
});

// When add ALL DAY ACCES ticket is selected
$('[data-ticket-type="all-access"]').click(function(e) {;
	// Reset ticket values
	$('#regular_ticketx').val('0');
	$('#total-amount').text('0.0');
	$('#alert').hide();

	// Clear old data
	$('#artist-day').text("");
	$('#artist-price').text("0");
	ticketPrice = 0.0;

	// Update modal with ticket data
	let $ticketElm = $(this).parent().parent();
	window.ticket = {
		ticketid: $ticketElm.find('[data-ticketid]').data('ticketid'),
		event: 'Haarlem Jazz - All Day (' + $ticketElm.find('[data-day]').data('day') + ')',
		price: $ticketElm.find('[data-price]').data('price'),
		day: $ticketElm.find('[data-day]').data('day'),
		type: 'allday'
	};

	$('#artist-name').text(window.ticket.day);
	$('#artist-price').text(window.ticket.price);

	ticketPrice = parseInt(window.ticket.price);
});

// Add ticket to cart
$('#add-to-cart').click(function() {
	let url = baseUrl + '/cart/add_to_cart';

	window.ticket.amount = $('#total-amount').text();
	window.ticket.tickets = $('#regular_ticketx').val();

	if (parseInt(window.ticket.amount) <= 0) {
		$('#alert-type').text('Error');
			$('#alert-message').text('Please select at least one ticket.');

			$('#alert').removeClass('alert-danger');
			$('#alert').removeClass('alert-success');
			$('#alert').addClass('alert-warning');
			$('#alert').show();
	} else {
		// Send request and handle response
		$.post(url, window.ticket, function(response) {
			if (response.search('success') == -1) { // Fail
				$('#alert-type').text('Error');
				$('#alert-message').text(response);

				$('#alert').removeClass('alert-warning');
				$('#alert').removeClass('alert-success');
				$('#alert').addClass('alert-danger');
				$('#alert').show();
			} 
			else { // Success
				let message = response.substring(9, response.length);

				$('#alert-type').text('Success');
				$('#alert-message').text(message);

				$('#alert').removeClass('alert-danger');
				$('#alert').removeClass('alert-warning');
				$('#alert').removeClass('alert-success');
				$('#alert').addClass('alert-success');
				$('#alert').show();
			}
		});
	}

});
</script>
{/literal}