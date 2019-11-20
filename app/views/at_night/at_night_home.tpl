{include file="{$layout}\\header.tpl"}

<body style="background-color: #F2F2F2; width: 100%; height: 100%; display: inline-block;">
    <section style="background-color: #FFFFFF; width: 70%; height: auto; margin-left: 230px;">
        <h2 style="text-align: center; font-family: helvetica;">{$page_title}</h2>
        <article style="width: 70%; height: 100%; display: inline-block; margin-left: 15%;">
            <section style="background-color: #F2F2F2; width: 750px; height: 220px; display: inline-block;">           
                {foreach from=$images item=$image}
                    {if $image['name'] == 'home_night_tour'}
                       <img style="width: 250px; height: 180px; margin-left: 20px; margin-top: -150px;" src={$image['path']}>
                    {/if}
                {/foreach}
                <section style="display: inline-block; margin-left: 10px;">
                    <h3>{$night_tour->getPageName()}</h3>
                    <h4 style="height: auto; width: 400px;">{$night_tour->getPageDescription()}</h4>
                    <button style="margin-top: 30px;"> Check it out!</button>
                </section>
            </section>

            <p></p>

            <section style="background-color: #F2F2F2; width: 750px; height: 220px; display: inline-block;">           
                {foreach from=$images item=$image}
                    {if $image['name'] == 'home_bar_tour'}
                       <img style="width: 250px; height: 180px; margin-left: 20px; margin-top: -150px;" src={$image['path']}>
                    {/if}
                {/foreach}
                <section style="display: inline-block; margin-left: 10px;">
                    <h3>{$beer_tour->getPageName()}</h3>
                    <h4 style="height: auto; width: 400px;">{$beer_tour->getPageDescription()}</h4>
                    <button style="margin-top: 10px;"> Check it out!</button>
                </section>
            </section>

            <p></p>

            <section style="background-color: #F2F2F2; width: 750px; height: 220px; display: inline-block;">           
                {foreach from=$images item=$image}
                    {if $image['name'] == 'home_cocktail_tour'}
                       <img style="width: 250px; height: 180px; margin-left: 20px; margin-top: -150px;" src={$image['path']}>
                    {/if}
                {/foreach}
                <section style="display: inline-block; margin-left: 10px;">
                    <h3>{$cocktail_tour->getPageName()}</h3>
                    <h4 style="height: auto; width: 400px;">{$cocktail_tour->getPageDescription()}</h4>
                    <button style="margin-top: 30px;"> Check it out!</button>
                </section>
            </section>

            <p></p>

            <section style="background-color: #F2F2F2; width: 750px; height: 220px; display: inline-block;">           
                {foreach from=$images item=$image}
                    {if $image['name'] == 'home_hookah_tour'}
                       <img style="width: 250px; height: 180px; margin-left: 20px; margin-top: -150px;" src={$image['path']}>
                    {/if}
                {/foreach}
                <section style="display: inline-block; margin-left: 10px;">
                    <h3>{$hookah_tour->getPageName()}</h3>
                    <h4 style="height: auto; width: 400px;">{$hookah_tour->getPageDescription()}</h4>
                    <button style="margin-top: 30px;"> Check it out!</button>
                </section>
            </section>

            <p></p>
        </article>
    </section>
</body>

{include file="{$layout}\\footer.tpl"}