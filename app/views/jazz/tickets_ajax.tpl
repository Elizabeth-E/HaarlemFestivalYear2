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
				<p class="allpass"> Thursday</p>
				<p class="allpass"> 26th July</p>
				<p class="allpass"> Pass</p>
				<p class="allpass"> &euro;35,-</p>
				<button type="button" class="btn btn-lg jazz" data-toggle="modal" data-target="#basicExampleModal">Select Ticket </button>
				<p class="fineprint"> Access to all events on this day</p>
			</div>
		</div>
		<div class="container col-lg-3">
			<div class="all-access">
				<p class="allpass"> Friday</p>
				<p class="allpass"> 27th July</p>
				<p class="allpass"> Pass</p>
				<p class="allpass"> &euro;35,-</p>
				<button type="button" class="btn btn-lg jazz" data-toggle="modal" data-target="#basicExampleModal">Select Ticket </button>
				<p class="fineprint"> Access to all events on this day</p>
			</div>
		</div>
		<div class="container col-lg-3">
			<div class="all-access">
				<p class="allpass"> Saturday</p>
				<p class="allpass"> 28th July</p>
				<p class="allpass"> Pass</p>
				<p class="allpass"> &euro;35,-</p>
				<button type="button" class="btn btn-lg jazz" data-toggle="modal" data-target="#basicExampleModal">Select Ticket </button>
				<p class="fineprint"> Access to all events on this day</p>
			</div>
		</div>
		<div class="container col-lg-3">
			<div class="all-access">
				<p class="allpass"> All Access</p>
				<p class="allpass"> Pass</p>
				<p class="allpass"> Thu, Fri, Sat</p>
				<p class="allpass"> &euro;80,-</p>
				<button type="button" class="btn btn-lg jazz" data-toggle="modal" data-target="#basicExampleModal">Select Ticket </button>
				<p class="fineprint"> Access to all events on this day</p>
			</div>
		</div>
</div>
	</section>
	<section>
		<h2>Single Tickets</h2>
		{foreach from=$eventList key=date item=events}
		<section>
			<h3 class="datesection">{$date}</h3>
			{foreach from=$eventList[$date] item=event}
			<div class="container jazzticket col-lg-12">
			<img src="{$www}{$event.picture|escape}" alt="{$event.artist|escape}" class="ticketpicture col-lg-2">
				<div class="jazzticket col-lg-8">
					<p class="jazzticketartist">{$event.artist|escape}</p>
					<p class="jazzticketp">{$event.location|escape}-{$event.hall|escape}</p>
					<p class="jazzticketp">{$event.time}</p>
				</div>
				<div class="jazzticket col-lg-2">
					<p class="jazzticketp">&euro; {$event.price}</p>
					<button type="button" class="btn btn-lg jazzhome" data-toggle="modal" data-target="#basicExampleModal">Select Ticket</button>
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
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-8"></div>
					<div class="col-xs-4">
						<p class="fineprintmodal"> Items added to cart are reserved for 24 hours</p>
						<button type="button" class="btn btn-lg jazz" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-lg jazz">Add to Cart</button>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>