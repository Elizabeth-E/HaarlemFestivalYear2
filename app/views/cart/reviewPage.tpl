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
                <p></p>
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
            <p></p>
        </section>
 
        <section class=review-section>
            <!--tickets-->
            {if !empty($tickets)}
              {foreach from=$tickets item=$ticket}                       
                <p></p>
                <section>
                    {if strpos($ticket[3], 'Night') != false}
                        <section class=review-night-ticket>
                            <section name=review-night-event-name>                           
                                <!--event name and language-->
                                <h3 name=event>{print_r($ticket[3], true)} ({print_r($ticket[0], true)})</h3>

                                {* <!--this button is used to edit the number of people who are able to join an activity-->
                                <button name=edit>Edit</button> *}

                                <!--date and time-->
                                <h3>{print_r(date('l jS F Y', $ticket[2]), true)} - {print_r(date('H:i', $ticket[2]), true)}</h3>    

                                <!--guide-->
                                <h3>Guide: {print_r($ticket[1], true)}</h3>  
                                
                                <!--regular-->
                                <h3>Regular tickets: €{number_format(print_r($ticket[4] * $ticket[7], true), 2, '.', '')}</h3> 

                                <!--family-->
                                <h3>Family tickets: €{number_format(print_r($ticket[5] * $ticket[8], true), 2, '.', '')}</h3> 
                            </section>
 
                            <!--total-->
                            <h3 name=total>Total: €{number_format(print_r($ticket[6], true), 2, '.', '')}</h3>
                        </section>                  
                    {/if}
                </section>
              {/foreach}
            {else}
                <h5 name=empty-cart>You have no items in your shopping cart :(</h5>
            {/if}
            <p name=review-space-before-article></p>
        </section> 
 
    </article>
    <p name=review-space></p>
 
</section>
{include file="{$layout}\\footer.tpl"}