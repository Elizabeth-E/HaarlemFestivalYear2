{include file="{$layout}\\header.tpl"}

<body style="background-color: #F2F2F2; width: 100%; height: 100%; display: inline-block; margin-top: 10%;">
    <section style="background-color: #FFFFFF; width: 70%; height: auto; margin-left: 230px;">
       <section style="margin-left: 1%;">
            <a href="{$www}" style="color: #ED7D22; display: inline-block; text-decoration: underline;"> Haarlem Festival</a>
            <p style="width: 7px; display: inline-block; margin-left: 3px;">></p>
            <a href="{$www}/night/" style="color: #ED7D22; display: inline-block; text-decoration: underline; margin-left: 3px; font-weight: bold;"> Haarlem At Night</a>
        </section>
        <h1 style="text-align: center; font-family: Helvetica Neue; font-weight: 1;">{$page_title}</h1>
        <article style="width: 70%; height: 100%; display: inline-block; margin-left: 15%;">
            {foreach from=$home_pages item=$page}
                    <section style="background-color: #F2F2F2; width: 750px; height: 220px; display: inline-block;">           
                        <section style="display: inline-block; margin-left: 10px;">
                            <h3>{$page[0]->getPageName()}</h3>
                            <section style="display: inline-block; width: 200px;">
                                {foreach from=$page[1] item=$item}
                                    <img style="width: 200px; height: 140px; margin-top: -90px;" src='{$item->getImagePath()}'>
                                {/foreach}
                            </section>
                            <section style="display: inline-block; margin-left: 20px;">
                                <h4 style="width: 400px; display: inline-block;">{$page[0]->getPageDescription()}</h4>
                                <a href="{$www}/night/getTourPageInfo/{$page_title}_{$page[0]->getPageName()}"><button style="color: #000000; background-color: #ED7D22; color: white; border: none; display: block;"> Check it out!</button></a>
                            </section>
                        </section>
                    </section>
                    <p style="display: block; height: 5px;"></p>
            {/foreach}
        </article>
    </section>
</body>

{include file="{$layout}\\footer.tpl"}