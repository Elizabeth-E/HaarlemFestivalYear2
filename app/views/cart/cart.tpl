<section style="margin-left: -400px; width: 500px; height: 40%; background-color: #F2F2F2; display: block; border: 1px black solid; postion: relative;">
    {if !empty($cart)}       
        {foreach from=$cart item=$item}
            <!--tour name-->
            <section style="text-align: center; width: 95%; height: 25px; border-bottom: 2px solid #F2F2F2; background-color: #FFFFFF; margin-left: 13px; font-family: Helvetica Neue; font-size: 17px;">
                 {print_r($item[3], true)}
            </section>
            <!--language-->
            <section style="line-height: 30px; width: 95%; height: 25px; background-color: #FFFFFF; margin-left: 13px; font-family: Helvetica Neue; font-size: 15px;">
                <section style="text-align: center; border-right: 2px solid #F2F2F2; display: inline-block; width: 80px;">
                    {print_r($item[0], true)}
                </section>
                <!--date-->
                <section style="text-align: center; border-right: 2px solid #F2F2F2; display: inline-block; width: 170px;">
                    {print_r(date('l jS F Y', $item[2]), true)}
                </section>
                <!--time-->
                <section style="text-align: center; border-right: 2px solid #F2F2F2; display: inline-block; width: 100px;">
                    Starts at: {print_r(date('H:i', $item[2]), true)}
                </section>
                <!--Guide's name-->
                <section style="text-align: center; display: inline-block;">
                    <p style="margin-left: 10px;">Guide: {print_r($item[1], true)}</p>
                </section>
            </section>
            <section style="border-top: 2px solid #F2F2F2; margin-top: 1px; width: 95%; height: 25px; border-bottom: 2px solid #F2F2F2; background-color: #FFFFFF; margin-left: 13px; font-family: Helvetica Neue; font-size: 17px;">
                <section style="width: 42.5%; text-align: center; display: inline-block; margin-left: 13px; font-family: Helvetica Neue; font-size: 17px; border-right: 2px solid #F2F2F2;">
                   Regular Tickets: {print_r($item[4], true)}
                </section>
                <section style="width: 42.5%; text-align: center; display: inline-block; margin-left: 13px; font-family: Helvetica Neue; font-size: 17px;">
                   Family Tickets: {print_r($item[5], true)}
                </section>
            </section>
            <br>
        {/foreach}
        <section style="height: 45px;"></section>
        <section style="width: 100%; margin-top: -30px;">
            <form method=POST style="margin-left: 23%;">
                <input type=submit value="Confirm & Pay" name="confirm_tickets" style="height: 40px; width: 130px; border-radius: 8%; display:inline-block; color: #FFFFFF; background-color: black;">
                <input type=submit value="Erase Tickets" name="delete_tickets" style="height: 40px; width: 130px; border-radius: 8%; display:inline-block; margin-left: 10%; color: #FFFFFF; background-color: black;">
            </form>
        </section>
    {/if}
</section>