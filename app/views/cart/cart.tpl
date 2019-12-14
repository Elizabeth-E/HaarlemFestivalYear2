<section class="cart-body">
    {if !empty($cart)}       
        {foreach from=$cart item=$item}
            <!--the ticket is formated based on which event the user has selected the ticket from-->
            {if strpos($item[3], 'Night') != false}
                <!--tour name-->
                <section class="cart-tour-name">
                    <h1>{print_r($item[3], true)}</h1>
                    <form method=POST>
                        <button name=delete_single>x</button>
                        <input type=hidden name="hidden_cart_language" value='{print_r($item[0], true)}'>
                        <input type=hidden name="hidden_cart_guide" value='{print_r($item[1], true)}'>
                        <input type=hidden name="hidden_cart_date" value='{print_r($item[2], true)}'>
                        <input type=hidden name="hidden_cart_event_name" value='{print_r($item[3], true)}'>
                        <input type=hidden name="hidden_cart_regular" value='{print_r($item[4], true)}'>
                        <input type=hidden name="hidden_cart_family" value='{print_r($item[5], true)}'>
                        <input type=hidden name="hidden_cart_total" value='{print_r($item[6], true)}'>
                    </form>
                </section>
                <section class=cart-tour-data>
                    <!--language-->
                    <section class=tour-language>
                        {print_r($item[0], true)}
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
                        <p>Guide: {print_r($item[1], true)}</p>
                    </section>
                </section>
                <section class="cart-tour-tickets">
                    <section id=ticket style="border-right: 2px solid #F2F2F2;">
                        Regular Tickets: {print_r($item[4], true)}
                    </section>
                    <section id=ticket>
                        Family Tickets: {print_r($item[5], true)}
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
                <input type=submit value="Confirm & Pay" name="confirm_tickets">
                <input type=submit value="Erase Tickets" name="delete_tickets" style="margin-left: 10%;">
            </form>
        </section>
    {/if}
</section>