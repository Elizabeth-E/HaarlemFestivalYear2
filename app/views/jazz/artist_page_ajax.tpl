     <ol class="breadcrumb">
            <li><a href="{$www}">Haarlem Festival</a></li>
            <li><a href="{$www}/Jazz">Haarlem Jazz</a></li>
            <li><a href="{$www}/jazz">Artists</a></li>
            <li><a href="#" class="active">{$artistInfo.artist}</a></li>
        </ol>
    <section>
    <h2>{$artistInfo.artist}</h2>
    <h3>Tickets for {$artistInfo.artist}</h3>

            <div class="row">
                <div class="container jazzticket col-lg-12">
                    <img src="{$www}{$artistTicket.picture|escape}" alt="{$artistTicket.artist|escape}" class="ticketpicture col-lg-2">
                        <div class="jazzticket col-lg-8">
                            <p class="jazzticketartist">{$artistTicket.artist|escape}</p>
                            <p class="jazzticketp">{$artistTicket.location|escape}-{$artistTicket.hall|escape}</p>
                            <p class="jazzticketp">{$artistTicket.time}</p>
                        </div>

                        <div class="jazzticket col-lg-2">
                            <p class="jazzticketp">&euro; {$artistTicket.price}</p>
                            <button type="button" class="btn btn-lg jazz" data-toggle="modal" id="not-yet-done" data-target="#basicExampleModal">Select Ticket </button>
                        </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <img src="{$www}{$artistInfo.picture}" alt="Gumbo Kings" class="img-responsive img-thumbnail">
                </div>
                <div class="col-lg-6">
                <h3>About the artist</h3>
                    <p>{$artistInfo.description}</p>
                </div>
            </div>
    
    </section>
    <section class="crossselling">
    <h2>Suggested Artist</h2>
    <div class="row">
    {foreach from=$crossSelling key=i item=artist}
                <div class="col-lg-4">
                    <a class="artistlabel" href="{$www}/jazz/artist_page/{$artist.urlSafeArtistName}">
                        <div class="row">
                            <img src="{$www}{$artist.picture}" alt="{$artist.artist}" class="artistpichome">
                        </div>
                        <div class="row artist-img footer">
                            <div class="col-lg-12">
                            {$artist.artist}
                            </div>
                        </div>
                    </a>
                </div>   
        {/foreach}
        </div>
    </section>
{literal}
<script>
// TODO: Finish this
// Go to tickets tab for now
$('#not-yet-done').click(function() {
    $('#tab-tickets a').click();
});
</script>
{/literal}