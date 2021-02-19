{include file="{$layout}\\header.tpl"}

<section class=night-page>
    <h1 name=review-page-name>{$page_title}</h1>
    <article name=review-page>
 
        <!--price outline-->
        <section class=review-price-outline>
            <h1>Price outline</h1>
            {foreach from=$tickets item=$ticket}
                {if isset($ticket['eventType']) && $ticket['eventType'] == 'jazz'}
                    <h6>{$ticket.event|escape}</h6>
                    <h6 name=price>&euro; {$ticket.totalPrice|escape}</h6>
                {else if isset($ticket['eventType']) && $ticket['eventType'] == 'allday'}
                    <h6>{$ticket.event|escape}</h6>
                    <h6 name=price>&euro; {$ticket.totalPrice|escape}</h6>
                {else if isset($ticket[0]) && strpos($ticket[0], 'Night') != false}
                    <h6>{print_r($ticket[0], true)}</h6><!--event name-->
                    <h6>{print_r($ticket[3], true)}....................................</h6><!--language-->
                    <h6 name=price>€{number_format(print_r($ticket[1], true), 2, '.', '')}</h6>
				{else if isset($ticket[0]) && strpos($ticket[0], 'Food') == true}
                    <h6>{print_r($ticket[0], true)}</h6><!--event name-->
				    <h6 name=price>€{number_format(print_r($ticket[1], true), 2, '.', '')}</h6> <!--reservation price-->
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
            
            <a href='{$www}/cart/checkout'><button name=checkout-btn>Checkout</button></a>

            <p></p>
        </section>
 
        <section class=review-section>
            <!--tickets-->
            {if !empty($tickets)}
              {foreach from=$tickets item=$ticket}                       
                <p></p>
                <section>
                    {if isset($ticket['eventType']) && $ticket['eventType'] == 'jazz'}
                    <section class=review-night-ticket>
                        <div class="row">
                            <div class="col-lg-2">
                                <img src="{$www}/{$ticket.img}" alt="{$ticket.artist}" class="artist-img" />
                            </div>
                            <div class="col-lg-10">
                                <section name="review-night-event-name">
                                    <h3 name="event" class="event-text">{$ticket.event|escape}</h3>
                                    <h3>{$ticket.location|escape}</h3>
                                    <h3>{$ticket.day|escape}</h3>
                                    <h3>{$ticket.time|escape}</h3>
                                    <h3>Regular tickets: (€ {$ticket.price|escape}): x{$ticket.tickets|escape}</h3> 
                                </section>

                                <h3 name=total>Total: € {$ticket.totalPrice|escape}</h3>    
                            </div>
                        </div>
                    </section>
                    {else if isset($ticket['eventType']) && $ticket['eventType'] == 'allday'}
                    <section class=review-night-ticket>
                        <section name=review-night-event-name>                           
                            <h3 name="event" class="event-text">{$ticket.event|escape}</h3>
                            <h3>{$ticket.day|escape}</h3>
                            <h3>Regular tickets: (€ {$ticket.price|escape}): x{$ticket.tickets|escape}</h3> 
                        </section>

                        <h3 name=total>Total: € {$ticket.totalPrice|escape}</h3>
                    </section> 
                    {else if isset($ticket[0]) && strpos($ticket[0], 'Night') != false}
                        <section class=review-night-ticket>
                            <section name=review-night-event-name>                           
                                <!--event name and language-->
                                <h3 name=event>{print_r($ticket[0], true)} ({print_r($ticket[3], true)})</h3>

                                <!--date and time-->
                                <h3>{print_r(date('l jS F Y', $ticket[2]), true)} - {print_r(date('H:i', $ticket[2]), true)}</h3>    

                                <!--guide-->
                                <h3>Guide: {print_r($ticket[4], true)}</h3>  
                                
                                <!--regular-->
                                <h3>Regular tickets: €{number_format(print_r($ticket[5] * $ticket[7], true), 2, '.', '')}</h3> 

                                <!--family-->
                                <h3>Family tickets: €{number_format(print_r($ticket[6] * $ticket[8], true), 2, '.', '')}</h3> 
                            </section>
 
                            <!--total-->
                            <h3 name=total>Total: €{number_format(print_r($ticket[1], true), 2, '.', '')}</h3>
                        </section> 
						

<!--food reservation cart review-->						 
					{else if  isset($ticket[0]) && strpos($ticket[0], 'Food') == true}
						<section class=review-night-ticket>
                            <section name=review-night-event-name>                           
                                <!--event name-->
                                <h3 name=event> {print_r($ticket[0], true)}</h3>

                                <!--date and time-->
                                <h3>{print_r(date('l jS F Y', $ticket[5]), true)} - {print_r(date('H:i', $ticket[4]), true)}</h3>    

                                <!--Number of adults-->
                                <h3>Adults: {print_r($ticket[2], true)}</h3>  
                                
                                <!--Number of kids-->
								<h3>Kids: {print_r($ticket[3], true)}</h3>  
                                </section>
 
                            <!--total-->
                            <h3 name=total>Total: €{number_format(print_r($ticket[1], true), 2, '.', '')}</h3>
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