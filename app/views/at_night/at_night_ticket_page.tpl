{include file="{$layout}\\header.tpl"}

<body style="background-color: #F2F2F2; width: 100%; height: 100%; display: inline-block;">
    <section style="background-color: #FFFFFF; width: 70%; height: auto; margin-left: 230px;">
        <h2 style="text-align: center; font-family: Helvetica Neue; font-weight: 1;">{$page_title}</h2>
        <article style="width: 70%; height: 100%; display: block; margin-left: 15%;">
            
            <!--this display will be used to filter the tickets by selecting the language-->
            <section style="width: 250px; height: 220px; background-color: #FFFFFF; display: inline-block; margin-left: -140px; border: 1px black solid;">
            </section>

            <section style="display: inline-block; width: 100%; height: auto; margin-left: 126px; margin-top: -245px;">
                <!--the tickets will be displayed here based on which tour the customer has selected-->
                {for $i=0 to $tickets|@count-1}
                <form method=POST style="display: inline-block; width: 100%;">
                    <section style="border: 1px black solid; background-color: #FFFFFF; width: 100%; height: 80px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                        <section style="text-align: center; height: 100%; width: 20%; border-right: 1px black solid; display: inline-block; font-family: Helvetica Neue; font-size: 20px;">
                            <p style="font-size: 20px;">{print_r(date('l', strtotime($tickets[$i]->getDate())), true)}</p>
                            {print_r(date('jS F Y', strtotime($tickets[$i]->getDate())), true)}
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
                        <input type=hidden name=hidden_guide_name value='{print_r($tickets[$i]->getGuideName(), true)}'>
                        <input type=hidden name=hidden_amount value='{print_r($tickets[$i]->getAmount(), true)}'>  
                        <input type=hidden name=hidden_event_name value='{print_r($tickets[$i]->getEventName(), true)}'>  
                        <input type=hidden name=hidden_date value='{print_r($tickets[$i]->getDate(), true)}'>  
                        <input type=hidden name=hidden_language value='{print_r($tickets[$i]->getLanguage(), true)}'>  
                        <input type=hidden name=hidden_regular_price value='{print_r($tickets[$i]->getRegularTicketPrice(), true)}'>  
                        <input type=hidden name=hidden_family_price value='{print_r($tickets[$i]->getFamilyTicketPrice(), true)}'>  
                        <input type=hidden name=hidden_page_id value='{print_r($page_id, true)}'>   
                        <section style="margin-top: -57px; display: block; margin-left: 628px; ">                
                            <input type=submit name="Select_Ticket" value="Select Ticket" style="width: 100px; height: 40px; color: white; background-color: #ED7D22; border-radius: 10%;">   
                        </section>     
                    </section>
                </form>
            {/for}
            </section>
        
        </article>

        <!--this is used to prevent the form from resubmitting the users input-->
        <script>
        if (window.history.replaceState) 
           window.history.replaceState(null, null, window.location.href);
        </script>
    </section>
</body>

{include file="{$layout}\\footer.tpl"}