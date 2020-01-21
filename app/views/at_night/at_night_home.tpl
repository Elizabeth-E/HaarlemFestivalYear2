{include file="{$layout}\\header.tpl"}

<section class=night-page>
    <section name=link-area>
        <a href="{$www}" class=link>Haarlem Festival</a>
        <p class=link-space>></p>
        <p class=link-current>Haarlem At Night</p>
    </section>
    <h1>{$page_title}</h1>
    <article>

        <!--images for home page-->
        {foreach from=$tour_pages item=$page}
                <section class=night-home-tour>           
                    <section>
                        <h3>{$page[0]->getPageName()}</h3>
                        <section name=image>
                            {foreach from=$page[1] item=$image}
                                <img src='{$image->getImagePath()}'>
                            {/foreach}
                        </section>
                        <section name=info>
                            <h4>{$page[0]->getPageDescription()}</h4>
                            <a href="{$www}/night/getTourPageInfo/{$page[0]->getPageName()}"><button>Check it out!</button></a>
                        </section>
                    </section>
                </section>
                <p name=home-tiny-space></p>
        {/foreach}

        <p name=home-bottom-space></p>

    </article>
</section>

{include file="{$layout}\\footer.tpl"}