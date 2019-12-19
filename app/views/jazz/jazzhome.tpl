{include file="{$layout}\\header.tpl"}

<main>
	<section class="container">
        {* <ul class="nav nav-tabs" id="myTabs">
            <li role="presentation" class="active" data-toggle="tab"><a href="#" >Artists</a></li>
            <li role="presentation" data-toggle="tab"><a href="#" >Tickets</a></li>
            <li role="presentation" data-toggle="tab"><a href="#" >Timetable</a></li>
        </ul> *}
<ul class="nav nav-tabs" id="myTabs">
  <li role="presentation" data-toggle="tab" id="tab-home" class="active"><a href="#">Home</a></li>
  <li role="presentation" data-toggle="tab" id="tab-tickets"><a href="#">Tickets</a></li>
  <li role="presentation" data-toggle="tab" id="tab-timetable"><a href="#">Timetable</a></li>
</ul>
    <section>

    <section class="container jazz">
        <ol class="breadcrumb">
            <li><a href="#">Haarlem Festival</a></li>
            <li><a href="#" class="active">Haarlem Jazz</a></li>
        </ol>

        <div id="tab-content"><!-- Will be filled by JS --></div>

        <hr id="section-break" />
    </section>

    <!-- TODO: Move to homepage -->
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
// Bypass Smartry Literal
var baseUrl = '{$www}';
{literal}
$('#tab-content').load(baseUrl + '/jazz/artists_ajax');

//javascript for using tabs 
$('#myTabs a').click(function (e) {
    e.preventDefault();

    var tabId = $(this).parent().attr('id');

    switch(tabId) {
        case 'tab-home':
            $('#tab-content').load(baseUrl + '/jazz/artists_ajax');
            break;
        case 'tab-tickets':
            $('#tab-content').load(baseUrl + '/jazz/tickets_ajax');
            break;
        case 'tab-timetable':
            $('#tab-content').load(baseUrl + '/jazz/timetable_ajax');
            break;
        default:
            $('#tab-content').load(baseUrl + '/jazz/artists_ajax');
    }
    
    $(this).tab('show');
});


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