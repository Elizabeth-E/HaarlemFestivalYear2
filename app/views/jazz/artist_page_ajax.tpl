     <ol class="breadcrumb">
            <li><a href="{$www}">Haarlem Festival</a></li>
            <li><a href="{$www}/Jazz">Haarlem Jazz</a></li>
            <li><a href="{$www}/jazz">Artists</a></li>
            <li><a href="#" class="active">Artist name goes here</a></li>
        </ol>
    <section>
    <h2>{$artistInfo.artist}</h2>
    <h3>Tickets for {$artistInfo.artist}</h3>
    {* <div class="container jazzticket col-lg-12">
				<div class="jazzticket col-lg-10">
					<p class="jazzticketartist">{$event.artist|escape}</p>
					<p class="jazzticketp">{$event.location|escape}-{$event.hall|escape}</p>
					<p class="jazzticketp">{$event.time}</p>
				</div>
				<div class="jazzticket col-lg-2">
					<p class="jazzticketp">&euro; {$event.price}</p>
					<button type="button" class="btn btn-lg jazz" data-toggle="modal" data-target="#basicExampleModal">Select Ticket </button>
				</div>
			</div> *}

            <div>{$artistInfo.description}</div>
            <div>{$artistInfo.picture}</div>
    
    </section>
    <section class="crossselling">
    <h2>CrossSelling</h2>
    </section>