<section class="cart-body">
    {if !empty($cart)}       
        {foreach from=$cart item=$item}
            <!--the ticket is formated based on which event the user has selected the ticket from-->
            {if isset($item['eventType']) && $item['eventType'] == 'jazz'}
                <section class="cart-tour-name">
                    <h1>{$item.event|escape}</h1>
                    <button name="delete_single">x</button>
                </section>
                <section class="cart-tour-tickets">
                    <section id=ticket style="border-right: 2px solid #F2F2F2;">
                        Tickets: {$item.tickets|escape}
                    </section>
                    <section id=ticket>
                        Price: &euro; {$item.price|escape}
                    </section>
                </section>
            {else if isset($item['eventType']) && $item['eventType'] == 'allday'}
                <section class="cart-tour-name">
                    <h1>{$item.event|escape}</h1>
                    <button name="delete_single">x</button>
                </section>
                <section class="cart-tour-tickets">
                    <section id=ticket style="border-right: 2px solid #F2F2F2;">
                        Tickets: {$item.tickets|escape}
                    </section>
                    <section id=ticket>
                        Price: &euro; {$item.price|escape}
                    </section>
                </section>
            {else if isset($item[0]) && strpos($item[0], 'Night') !== false}
                <!--tour name-->
                <section class="cart-tour-name">
                    <h1>{print_r($item[0], true)}</h1>
                    <form method=POST>
                        <button name=delete_single>x</button>
                        <input type=hidden name="hidden_cart_language" value='{print_r($item[3], true)}'>
                        <input type=hidden name="hidden_cart_guide" value='{print_r($item[4], true)}'>
                        <input type=hidden name="hidden_cart_date" value='{print_r($item[2], true)}'>
                        <input type=hidden name="hidden_cart_event_name" value='{print_r($item[0], true)}'>
                        <input type=hidden name="hidden_cart_regular" value='{print_r($item[5], true)}'>
                        <input type=hidden name="hidden_cart_family" value='{print_r($item[6], true)}'>
                        <input type=hidden name="hidden_cart_total" value='{print_r($item[1], true)}'>
                        <input type=hidden name="hidden_cart_regular_price" value='{print_r($item[7], true)}'>
                        <input type=hidden name="hidden_cart_family_price" value='{print_r($item[8], true)}'>
                    </form>
                </section>
                <section class=cart-tour-data>
                    <!--language-->
                    <section class=tour-language>
                        {print_r($item[3], true)}
                    </section>
                    <!--date-->
                    <section class=tour-date>
                        {print_r(date('l jS F Y', $item[2]), true)}
                    </section>
                    <!--time-->
                    <section class=tour-time>
                        Starts at: {print_r(date('H:i', $item[2]), true)}
                    </section>
                    <!--Guide's name-->
                    <section class=tour-guide-name>
                        <p>Guide: {print_r($item[4], true)}</p>
                    </section>
                </section>
                <section class="cart-tour-tickets">
                    <section id=ticket style="border-right: 2px solid #F2F2F2;">
                        Regular Tickets: {print_r($item[5], true)}
                    </section>
                    <section id=ticket>
                        Family Tickets: {print_r($item[6], true)}
                    </section>
                </section>

<!--food reservation cart-->
           {else if isset($item[0]) && strpos($item[0], 'Food') == true}
		        <section class="cart-tour-name">
                    <h1>{print_r($item[0], true)}</h1>
                    <form method=POST>
                        <button name=delete_single>x</button>
                        <input type=hidden name="hidden_cart_event_name" value='{print_r($item[0], true)}'>
                        <input type=hidden name="hidden_cart_date" value='{print_r($item[5], true)}'>
                        <input type=hidden name="hidden_cart_time" value='{print_r($item[4], true)}'>
                        <input type=hidden name="hidden_no_of_adults" value='{print_r($item[2], true)}'>
                        <input type=hidden name="hidden_no_of_kids" value='{print_r($item[3], true)}'>
                        <input type=hidden name="hidden_cart_total" value='{print_r($item[1], true)}'>
                    </form>
                </section>

				<section class=cart-tour-data>
                    <!--date-->
                    <section class=tour-date>
                        {print_r(date('l jS F Y', $item[5]), true)}
                    </section>
                    <!--time-->
                    <section class=tour-time>
                        Starts at: {print_r(date('H:i', $item[4]), true)}
                    </section>
                    <!--Number of adults-->
                    <section class=tour-guide-name>
                        <p>Adults: {print_r($item[2], true)}</p>
                    </section>
					 <!--Number of kids-->
                    <section class=tour-guide-name>
                        <p>Kids: {print_r($item[3], true)}</p>
                    </section>
                </section>  
            {/if}
            <br>
        {/foreach}

        <section class=cart-space></section>
        <section class=cart-submit-button>
            <section id=total-cost>
                <p id=total-cost-name>Total cost: </p>
                <p id=total-cost-format>€{number_format(print_r($total_payment, true), 2, '.', '')}</p>
            </section>
            <form method=POST style="margin-left: 23%;">
                <a href="{$www}/cart/confirmTickets"><input type=button value="Confirm & Pay" name="confirm_tickets"></a>
                <input type=submit value="Erase Tickets" name="delete_tickets" style="margin-left: 10%;">
            </form>
        </section>
    {/if}
</section>