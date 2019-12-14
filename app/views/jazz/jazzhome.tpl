{include file="{$layout}\\header.tpl"}

<main>
	<section class="container">
        <ul class="nav nav-tabs">
            <li role="presentation" class="active"><a href="#">Artists</a></li>
            <li role="presentation"><a href="#">Tickets</a></li>
            <li role="presentation"><a href="#">Timetable</a></li>
        </ul>
    <section>

    <section class="container jazz">
        <ol class="breadcrumb">
            <li><a href="#">Haarlem Festival</a></li>
            <li><a href="#" class="active">Haarlem Jazz</a></li>
        </ol>

        <h2 class="section-heading">Featured Artists</h2>

        <!-- TODO: All images need alternative text -->
        <!-- TODO: All images should be the same size -->
        <!-- TODO: Images should link to the correct location -->
        <div class="row">
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/Gumbo_Kings_2008.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/wickedjazzsound.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/evolve-band.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
        </div>
        <div class="row">
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/Jonna-Fraser.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/nordians.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/unclesue.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
        </div>
        <div class="row">
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/KrisAllen.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/Ntjam-Rosie.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/myles-sanko.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
        </div>
        <div class="row">
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/fox.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/han-bennink.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/rilan.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
        </div>
        <div class="row">
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/lilithmerlot.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/garedunord.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/SIX.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
        </div>
        <div class="row">
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/soundsystem.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/familyXL.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
            <div class="col-lg-4"><a href="#"><img src="{$www}/img/jazz-event/Thompson.jpg" alt="whatever band" class="img-responsive img-thumbnail"></a></div>
        </div>

        <div class="row">
            <div class="col-lg-offset-4 col-lg-4">
                <button type="button" class="btn btn-primary btn-lg" id="tickets-button">Find Tickets</button>
            </div>
        </div>
        <hr id="section-break" />
    </section>


    <section class="container jazz">
        <div class="row">
            <div class="col-lg-8">
                <h1>Event Location</h1>
                <p>Haarlem Jazz events can be seen in two different venues. The Patronaat and the Grote Markt.</p>
                <div class="row">
                    <div class="col-lg-6">
                        <strong>Patronaat</strong>
                        <address>
                            Zijsingel 2<br />
                            2013 DN Haarlem<br />
                            +3123 517 5850
                        </address>
                    </div>
                    <div class="col-lg-6">
                        <strong>Grote Markt</strong>
                        <address>
                            Grote Martk<br />
                            2011 RD Haarlem
                        </address>
                    </div>
                </div>
            </div>
            <div class="col-lg-4" id="map"></div>
        </div>
    </sections>
	
</div>
</main>

<script>
{literal}
// Initialize and add Google Maps
function initMap() {
    var haarlem = {lat: 52.3813348,	lng: 4.6341281};
    var groteMarkt = {lat: 52.3813124, lng: 4.63482};

    var map = new google.maps.Map(
        document.getElementById('map'), {
            zoom: 15,
            center: haarlem
        });
        
    var marker = new google.maps.Marker({
        position: groteMarkt,
        map: map
    });
}
{/literal}
</script>

<!-- TODO: Billing needs to be added to the API -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5NjCF0h6oSUfKx2FYza-1kxeLTcYUK1M&callback=initMap"></script>

{include file="{$layout}\\footer.tpl"}