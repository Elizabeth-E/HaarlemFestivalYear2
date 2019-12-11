{include file="{$layout}\\header.tpl"}

<section class=maincontent>
    <section class=night-page>
       <section style="margin-left: 1%;">
            <a href="{$www}" class=night-link>Haarlem Festival</a>
            <p class=night-link-space>></p>
            <p class=night-page-main>Haarlem At Night</p>
        </section>
        <h1>{$page_title}</h1>
        <article>

            <!--images for home page-->
            {foreach from=$tour_pages item=$page}
                    <section class=night-home-tour>           
                        <section style="display: inline-block; margin-left: 10px;">
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

                    <p style="display: block; height: 5px;"></p>

            {/foreach}

            <p style="display: block; height: 40px;"></p>

        </article>
    </section>
</section>

{include file="{$layout}\\footer.tpl"}