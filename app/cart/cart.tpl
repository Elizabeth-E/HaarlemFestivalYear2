<body>
    <section style="margin-left: -400px; width: 500px; height: 150px; background-color: white; display: block; margin-top: 50px; border: 1px black solid; postion: relative;">
        {if empty($shoppingCart)}
            <section style="margin-top: 13%;">
                {print_r("Please select a ticket to proceed", true)}
            </section>
        {else}
           {foreach from=$shoppingCart item=$ticket}
                {print_r($ticket->getAmount())}
            {/foreach}
        {/if}
    </section>
</body>