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

        <p name=night-tour-space></p>
           
    </article>
</section>

{include file="{$layout}\\footer.tpl"}