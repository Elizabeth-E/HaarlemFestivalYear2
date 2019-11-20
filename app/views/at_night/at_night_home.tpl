{include file="{$layout}\\header.tpl"}

<body style="background-color: #F2F2F2; width: 100%; height: 100%; display: inline-block;">
    <section style="background-color: #FFFFFF; width: 70%; height: auto; margin-left: 230px;">
        <h2 style="text-align: center; font-family: helvetica;">{$page_title}</h2>
        <article style="width: 70%; height: 100%; display: inline-block; margin-left: 15%;">
            <section style="background-color: #F2F2F2; width: auto; height: auto; display: inline-block;">
                <h3>{$night_tour->getPageName()}</h3>
                <h3>{$night_tour->getPageDescription()}</h3>
                <button> Check it out!</button>
            </section>

            <p></p>

            <section style="background-color: #F2F2F2; width: auto; height: auto; display: inline-block;">
                <h3>{$beer_tour->getPageName()}</h3>
                <h3>{$beer_tour->getPageDescription()}</h3>
                <button> Check it out!</button>
            </section>

            <p></p>

            <section style="background-color: #F2F2F2; width: auto; height: auto; display: inline-block;">
                <h3>{$cocktail_tour->getPageName()}</h3>
                <h3>{$cocktail_tour->getPageDescription()}</h3>
                <button> Check it out!</button>
            </section>

            <p></p>

            <section style="background-color: #F2F2F2; width: auto; height: auto; display: inline-block;">
                <h3>{$hookah_tour->getPageName()}</h3>
                <h3>{$hookah_tour->getPageDescription()}</h3>
                <button> Check it out!</button>
            </section>
        </article>
    </section>
</body>

{include file="{$layout}\\footer.tpl"}