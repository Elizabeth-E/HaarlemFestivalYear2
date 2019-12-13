{include file="{$layout}\\header.tpl"}

<section class=night-page>
    <h1 name=review-page-name>{$page_title}</h1>
    <article name=review-page>

        <!--price outline-->
        <section class=review-price-outline>
            <h1>Price outline</h1>
            {foreach from=$tickets item=$ticket}
                {if strpos($ticket[3], 'Night') != false}
                    <h6>{print_r($ticket[3], true)}</h6>
                    <h6>{print_r($ticket[0], true)}....................................</h6>
                    <h6 name=price>€{number_format(print_r($ticket[6], true), 2, '.', '')}</h6>
                {/if}
                <p style="height: 1px;"></p>
            {/foreach}

            <!--total without vat-->
            <h6>Total without VAT: </h6>
            <h6 name=price>€{number_format(print_r($cost, true), 2, '.', '')}</h6>

            <!--vat-->
            <h6>VAT: </h6>
            <h6 name=price>€{number_format(print_r($cost_with_VAT, true), 2, '.', '')}</h6>

            <!--total with vat-->
            <h6>Total with VAT: </h6>
            <h6 name=price>€{number_format(print_r($cost + $cost_with_VAT, true), 2, '.', '')}</h6>

            <button name=checkout-btn>Checkout</button>
            <p style="height: 2px;"></p>
        </section>

        <section class=review-section>
            <!--tickets-->
            {foreach from=$tickets item=$ticket}                       
                <p style="height: 5px;"></p>
                <section style="margin-left: 10%;">
                    {if strpos($ticket[3], 'Night') != false}
                        <section class=review-night-ticket>
                            <section name=review-night-event-name>
                            
                                <!--event name and language-->
                                <h3 style="font-weight: bold; marg">{print_r($ticket[3], true)} ({print_r($ticket[0], true)})</h3>

                                <!--date and time-->
                                <h3 style="margin-top: -5px;">{print_r(date('l jS F Y', $ticket[2]), true)} - {print_r(date('H:i', $ticket[2]), true)}</h3>

                                <!--guide-->
                                <h3 style="margin-top: -5px;">Guide: {print_r($ticket[1], true)}</h3>  

                            </section>

                            <!--total-->
                            <h3 name=total>Total: €{number_format(print_r($ticket[6], true), 2, '.', '')}</h3>

                        </section>                  
                    {/if}
                </section>
            {/foreach}
            <p style="height: 5px;"></p>
        </section> 

    </article>
    <p style="height: 100px;"></p>

</section>
{include file="{$layout}\\footer.tpl"}