{include file="{$layout}\\header.tpl"}

<section class=night-page>
    <section name=link-area>
        <a href="{$www}" class=link>Haarlem Festival</a>
        <p class=link-space>></p>
        <a href="{$www}/night" class=link>Haarlem At Night</a>
        <p class=link-space>></p>
        <p class=link-current>{$page_title_link}</p>
    </section>
    <h1>{$page_title}</h1>
    <article>

        <h2>{$description}</h2>
        <a href="{$www}/night/getTicketPageInfo/{$page_title}"><button>Get Tickets</button></a>
        <p name=space-after-get-ticket></p>

        <!--images of locations-->
        <section id=night-tour-images>
            {foreach from=$tour_images item=$image}             
                <section>
                    <img src={$image->getImagePath()}>
                    <p>{$image->getImageName()}</p>                  
                </section> 
                <p></p>       
            {/foreach}
        </section>

        <div id=map></div>

        <script>
        // Initialize and add Google Maps
        function initMap() 
        {
            var haarlem = 
            {
                lat: 52.3813348,	
                lng: 4.6341281
            };

            {* var groteMarkt = 
            {
                lat: 52.3813124, 
                lng: 4.63482
            }; *}

            var map = new google.maps.Map(document.getElementById('map'), 
            {
                zoom: 15,
                center: haarlem
            });
        
           {foreach from=$markers item=$location}
                var marker = new google.maps.Marker({
                    position: 
                    {
                        lat: {$location->getLatitude()}, 
                        lng: {$location->getLongitude()}
                    },
                    map: map,
                    title: '{$location->getLocationName()}'
                    });
            {/foreach}
        }
        </script>

        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5NjCF0h6oSUfKx2FYza-1kxeLTcYUK1M&callback=initMap"></script>
        
        <p name=night-tour-space></p>
           
    </article>
</section>

{include file="{$layout}\\footer.tpl"}