{include file="{$layout}\\header.tpl"}
<section class=about-page>
    <section name=link-area>
        <a href="{$www}" class=link>Haarlem Festival</a>
        <p class=link-space>></p>
        <p class=link-current>About</p>
    </section>
    <h1>{$page_title}</h1>
    <article>
        {foreach from=$first_page_description item=$line}
            <h2>{$line}</h2>
        {/foreach}

        <section name=members>
            <h1>{$page_title_2}</h1>
            {foreach from=$images item=$image}
                <img src={$image->getImagePath()} name=member>
            {/foreach}

            {foreach from=$second_page_description item=$line}
                <section name=member-info>
                    {foreach from=explode(',', $line) item=$line}
                        <h2>{$line}</h2>
                    {/foreach}
                </section>
            {/foreach}
        </section>

        <h1>{$page_title_3}</h1>
        {foreach from=$third_page_description item=$line}
            <h2>{$line}</h2>
        {/foreach}
    </article>
    <p name=about-page></p>
</section>
{include file="{$layout}\\footer.tpl"}