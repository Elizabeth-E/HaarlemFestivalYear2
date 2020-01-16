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
        
        <!--facrebook social media feed-->
        <div id="fb-root"></div>
            <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2"></script>
        <div class="fb-comments" data-href="{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}" data-width="600" data-numposts="5"></div>

        <script>
            window.fbAsyncInit = function() {
                FB.init({
                    appId: 'your-app-id',
                    autoLogAppEvents : true,
                    xfbml : true,
                    version : 'v3.2'
                });
            };
        </script>

        <script async defer src="https://connect.facebook.net/en_US/sdk.js"></script>

        <p name=night-tour-space></p>
           
    </article>
</section>

{include file="{$layout}\\footer.tpl"}