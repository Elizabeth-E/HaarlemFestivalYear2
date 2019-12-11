{include file="{$layout}\\header.tpl"}

<section class=maincontent>
    <section class=night-page>
        <section style="margin-left: 1%;">
            <a href="{$www}" class=night-link>Haarlem Festival</a>
            <p class=night-link-space>></p>
            <a href="{$www}/night" class=night-link>Haarlem At Night</a>
            <p class=night-link-space>></p>
            <p class=night-page-main>{$page_title_link}</p>
        </section>
        <h1>{$page_title}</h1>
        <article>

            <h2>{$description}</h2>
            <a href="{$www}/night/getTicketPageInfo/{$page_title}"><button>Get Tickets</button></a>
            <p style="height: 5px;"></p>

            <!--images of locations-->
            <section id=night-tour-images>
                {foreach from=$tour_images item=$image}             
                    <section style="display: inline-block;">
                        <img src={$image->getImagePath()}>
                        <p>{$image->getImageName()}</p>                  
                    </section> 
                    <p style="width: 20px; display: inline-block;"></p>       
                {/foreach}
            </section>

           <p style="height: 100px;"></p>
           
        </article>
    </section>
</section>

{include file="{$layout}\\footer.tpl"}