{include file="{$layout}\\header.tpl"}

<body style="background-color: #F2F2F2; width: 100%; height: auto; display: inline-block; margin-top: 10%;">
    <section style="background-color: #FFFFFF; width: 70%; height: 100%; margin-left: 230px;">
        <section style="margin-left: 1%;">
            <a href="{$www}" style="color: #ED7D22; display: inline-block; text-decoration: underline;"> Haarlem Festival </a>
            <p style="width: 7px; display: inline-block; margin-left: 3px;">></p>
            <a href="{$www}/night/" style="color: #ED7D22; display: inline-block; text-decoration: underline; margin-left: 3px;"> Haarlem At Night</a>
            <p style="width: 7px; display: inline-block; margin-left: 3px;">></p>
            <a href="{$www}/night/getTourPageInfo/{$page_title_link}" style="color: #ED7D22; display: inline-block; text-decoration: underline; margin-left: 3px; font-weight: bold;"> {$page_title_link} </a>
        </section>
        <h1 style="text-align: center; font-family: Helvetica Neue; font-weight: 1;">{$page_title}</h1>
        <p style="height: 5px;"></p>
        <h2 style="font-family: Helvetica Neue; font-weight: 1; width: 58%; font-size: 26px; margin-left: 25%;">{$description}</h2>
        <a href="{$www}/night/getTicketPageInfo/{$page_title}"><button style="font-family: Helvetica Neue; font-weight: 1; width: 100px; height: 30px; border:none; font-size: 14px; margin-left: 25%; background-color: #ED7D22; color: #FFFFFF;;"> Get Tickets </button></a>
        <p style="height: 5px;"></p>

        <!--images of locations-->
        <section style="width: 70%; height: 40%; display: block; margin-left: 25%;">
            {foreach from=$tour_images item=$image}             
                <section style="display: inline-block;">
                    <img style="width: 180px; height: 180px; display: block;"src={$image->getImagePath()}>
                    <p style="text-align: center; width: 180px; background-color: #ED7D22; color: #FFFFFF; border: none;">{$image->getImageName()}</p>
                    <p style="height: 15px;"></p>
                </section> 
                <p style="width: 20px; display: inline-block;"></p>       
            {/foreach}
        </section>

        <p style="height: 20px;"></p>
        
    </section>
</body>

{include file="{$layout}\\footer.tpl"}