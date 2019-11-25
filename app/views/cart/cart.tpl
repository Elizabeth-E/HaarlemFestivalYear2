<section style="margin-left: -400px; width: 500px; height: 40%; background-color: #F2F2F2; display: block; margin-top: 50px; border: 1px black solid; postion: relative;">
    {if empty($cart)}
        <section style="margin-top: 13%;">
            {print_r("Please select a ticket to proceed", true)}
        </section>
    {else}
        {foreach from=$cart item=$item}
            <section style="text-align: center; width: 95%; height: 30px; border-bottom: 1px solid black; background-color: #FFFFFF; margin-left: 13px; font-family: Helvetica Neue; font-size: 17px;">
                 {print_r($item[3], true)}
            </section>
            <section style="line-height: 30px; text-align: center; width: 95%; height: 30px; background-color: #FFFFFF; margin-left: 13px; font-family: Helvetica Neue; font-size: 15px;">
                <section style="border-right: 1px solid black; display: inline-block;">
                    {print_r($item[0], true)}
                </section>
                <section style="border-right: 1px solid black; display: inline-block;">
                    {print_r(date('l jS F Y', $item[2]), true)}
                </section>
                <section style="border-right: 1px solid black; display: inline-block;">
                    Starts at: {print_r(date('H:i', $item[2]), true)}
                </section>
                <section style="display: inline-block;">
                    Guide: {print_r($item[1], true)}
                </section>
            </section>
            <br>
        {/foreach}
    {/if}
    <section style="width: 100%; margin-left:0; display:block;">
        <form method=POST>
            <input type=submit value="Confirm & Pay" name="Confirm_Tickets">
            <input type=submit value="Erase Tickets" name="Delete_Tickets">
        </form>
    <section>
</section>
