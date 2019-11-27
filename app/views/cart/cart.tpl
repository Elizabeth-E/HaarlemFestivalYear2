<section style="order:1; margin-left: -400px; width: 500px; height: 40%; background-color: #F2F2F2; display: block; border: 1px black solid; postion: relative;">
    {if empty($cart)}
        <section style="margin-top: 2%; text-align: center; height: 50px;">
            <p style="margin-top: 38px;">{print_r("Please select a ticket to proceed", true)}</p>
        </section>
    {else}
        {foreach from=$cart item=$item}
            <section style="text-align: center; width: 95%; height: 25px; border-bottom: 2px solid #F2F2F2; background-color: #FFFFFF; margin-left: 13px; font-family: Helvetica Neue; font-size: 17px;">
                 {print_r($item[3], true)}
            </section>
            <section style="line-height: 30px; width: 95%; height: 25px; background-color: #FFFFFF; margin-left: 13px; font-family: Helvetica Neue; font-size: 15px;">
                <section style="text-align: center; border-right: 2px solid #F2F2F2; display: inline-block; width: 80px;">
                    {print_r($item[0], true)}
                </section>
                <section style="text-align: center; border-right: 2px solid #F2F2F2; display: inline-block; width: 170px;">
                    {print_r(date('l jS F Y', $item[2]), true)}
                </section>
                <section style="text-align: center; border-right: 2px solid #F2F2F2; display: inline-block; width: 100px;">
                    Starts at: {print_r(date('H:i', $item[2]), true)}
                </section>
                <section style="text-align: center; display: inline-block;">
                    <p style="margin-left: 10px;">Guide: {print_r($item[1], true)}</p>
                </section>
            </section>
            <br>
        {/foreach}
        <section style="width: 100%; margin-top: -30px;">
            <form method=POST style="margin-left: 23%;">
                <input type=submit value="Confirm & Pay" name="Confirm_Tickets" style="height: 40px; width: 130px; border-radius: 8%; display:inline-block; color: #FFFFFF; background-color: black;">
                <input type=submit value="Erase Tickets" name="Delete_Tickets" style="height: 40px; width: 130px; border-radius: 8%; display:inline-block; margin-left: 10%; color: #FFFFFF; background-color: black;">
            </form>
        </section>
    {/if}
</section>
