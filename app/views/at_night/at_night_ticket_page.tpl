{include file="{$layout}\\header.tpl"}

<body style="background-color: #F2F2F2; width: 100%; height: 100%; display: inline-block;">
    <section style="background-color: #FFFFFF; width: 70%; height: auto; margin-left: 230px;">
        <h2 style="text-align: center; font-family: Helvetica Neue;">{$page_title}</h2>
        <article style="width: 70%; height: 100%; display: inline-block; margin-left: 15%;">

        <!--the tickets will be displayed here based on which tour the customer has selected-->
        {for $i=0 to $tickets|@count-1}
            <section style="border: 1px black solid; background-color: #F2F2F2; width: 100%; height: 100px;">
                <section style="text-align: center; height: 100%; width: 20%; border-right: 1px black solid; display: inline-block; font-family: Helvetica Neue; font-size: 20px;">
                    <section style="margin-top: 22px;">
                        {print_r(date('l', strtotime($tickets[$i]->getDate())), true)}
                        <br>
                        {print_r(date('jS F Y', strtotime($tickets[$i]->getDate())), true)}
                    </section>
                </section>
                <section style="text-align: center; height: 100%; width: 20%; border-right: 1px black solid; display: inline-block; font-family: Helvetica Neue; font-size: 20px;">
                    <section style="margin-top: 50px;">{print_r($tickets[$i]->getLanguage(), true)}</section>
                </section>
                <section style="text-align: center; height: 100%; width: 20%; border-right: 1px black solid; display: inline-block; font-family: Helvetica Neue; font-size: 20px;">
                    <p style="font-size: 20px;"> Starts at: </p>
                    {print_r(date('H:i', strtotime($tickets[$i]->getDate())), true)}
                </section>
                <section style="text-align: center; height: 100%; width: 20%; border-right: 1px black solid; display: inline-block; font-family: Helvetica Neue; font-size: 20px;">
                    <p style="font-size: 20px;"> Guide: </p>
                    {print_r($tickets[$i]->getGuideName(), true)}
                </section>              
                    <a href="{$www}/cart/setTicket/{$i}{$tickets}"><button style="border-radius: 20px;  margin-left: 18px;"> Select Ticket </button></a>
            </section>
            <br>
        {/for}

        </article>
    </section>
</body>

{include file="{$layout}\\footer.tpl"}