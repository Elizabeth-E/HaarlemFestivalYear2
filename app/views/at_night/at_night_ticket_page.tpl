{include file="{$layout}\\header.tpl"}

<body style="background-color: #F2F2F2; width: 100%; height: 100%; display: inline-block; margin-top: 10%;">
    <section style="background-color: #FFFFFF; width: 70%; height: auto; margin-left: 230px;">
     <section style="margin-left: 1%;">
            <a href="{$www}" style="color: #ED7D22; display: inline-block; text-decoration: underline;"> Haarlem Festival </a>
            <p style="width: 7px; display: inline-block; margin-left: 3px;">></p>
            <a href="{$www}/night/" style="color: #ED7D22; display: inline-block; text-decoration: underline; margin-left: 3px;"> Haarlem At Night</a>
            <p style="width: 7px; display: inline-block; margin-left: 3px;">></p>
            <a href="{$www}/night/getTourPageInfo/{$tour_page}" style="color: #ED7D22; display: inline-block; text-decoration: underline; margin-left: 3px;">{$tour_page}</a>
            <p style="width: 7px; display: inline-block; margin-left: 3px;">></p>
            <p style="color: #ED7D22; display: inline-block; text-decoration: underline; margin-left: 3px; font-weight: bold;">Tickets</p>
        </section>
        <h1 style="text-align: center; font-family: Helvetica Neue; font-weight: 1;">{$page_title}</h1>
        <article style="width: 70%; height: 100%; display: block; margin-left: 15%;">
            
            <!--this display will be used to filter the tickets by selecting the language-->
            <section style="font-family: Helvetica Neue; width: 250px; height: 160px; background-color: #FFFFFF; display: inline-block; margin-left: -140px; border: 1px black solid;">
                <form method=POST>
                    <header style="background-color: #FFCC99; width: 100.1%; height: 30px; text-align: center; margin-top: -20px;">
			            <h3 style="font-size: 16px; font-weight: normal; padding-top: 8px;"> Select your preferred language</h3>
			        </header>

                    <section style="margin-top: 20px; margin-left:-2px;">
                    <!--filters the ticket if the user selects a langauge-->
                        {foreach from=$language_images item=$image}
                            <section style="width: 40px; display: inline-block; margin-left: 26px;">
                                <img style="width: 60px; height: 40px;"src={$image->getImagePath()}>
                                <input type=submit name=language value='{$image->getImageName()}' style="background-color: #ED7D22; color: #FFFFFF; border: none; width: 60px; margin-top: 8px;">
                            </section>
                        {/foreach}
                        
                    </section>
                    
                    <input type=submit name=language value='Show All Available Languages' style="background-color: #ED7D22; color: #FFFFFF; margin-top: 3.5%; height: 30px; width: 100.1%; border: none;">
                </form>
            </section>

            <section style="display: inline-block; width: 100%; height: auto; margin-left: 126px; margin-top: -131px;">
                <!--the tickets will be displayed here based on which tour the customer has selected-->
                {for $i=0 to $tickets|@count-1}
                    <!--ticket-->
                    <section style="margin-top: -28px; height: 140px; display: inline-block; width: 100%; font-family: Helvetica Neue; font-size: 20px;">
                        <section style="border: 1px black solid; background-color: #FFFFFF; width: 100%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                            <!--date-->
                            <section style="text-align: center; width: 20%; border-right: 1px black solid; display: inline-block;">
                                <p style="font-size: 20px;">{print_r(date('l', strtotime($tickets[$i]->getDate())), true)}</p>
                                {print_r(date('jS F Y', strtotime($tickets[$i]->getDate())), true)}
                            </section>
                            <!--image of country flag with language-->
                            <section style="text-align: center; width: 20%; border-right: 1px black solid; display: inline-block;">
                                {foreach from=$language_images item=$image}
                                    {if $image->getImageName() == print_r($tickets[$i]->getLanguage(), true)}
                                        <img style="width: 60px; height: 40px; margin-top: 7px;" src={$image->getImagePath()}>
                                        <section style="margin-top: 3.6px;">{print_r($tickets[$i]->getLanguage(), true)}</section>
                                    {/if}
                                {/foreach}                            
                            </section>
                            <!--time-->
                            <section style="text-align: center; width: 20%; border-right: 1px black solid; display: inline-block;">
                                <p style="font-size: 20px;"> Starts at: </p>
                                {print_r(date('H:i', strtotime($tickets[$i]->getDate())), true)}
                            </section>
                            <!--name of the guide-->
                            <section style="text-align: center; width: 20%; border-right: 1px black solid; display: inline-block;">
                                <p style="font-size: 20px;"> Guide: </p>
                                {print_r($tickets[$i]->getGuideName(), true)}
                            </section>                            
                        </section>
                        <!-- 'Select Ticket' button-->
                        <section style="margin-top: -54px; display: block; margin-left: 92.6%; ">                
                            <button onclick="showDropDown({$i})" style="font-size: 15px; width: 110px; height: 30px; color: white; background-color: #ED7D22; border-radius: 5%; border: none; margin-left: -66px;"> Select Ticket </button>
                            <script style="display: none;">{include file="js/showDropDownMenu.js"}</script>
                        </section>
                    </section> 

                    <!--Drop-down menu-->
                    <section id="showDropDown{$i}" style="display: none;">
                        <section style="font-family: Helvetica Neue; width: 100%; background-color: #FFCC99; margin-top: -63px;; display: block;">
                            <section style="width: 60%; margin-top: -100px; display: inline-block">
                                <!--family ticket-->
                                <section style="margin-top: 80px; width:100%; height: 70px; display: block;">
                                    <p style="font-size: 18px; display: inline-block; margin-left: 10px;">Family Ticket (4 people) €{number_format((float)print_r($tickets[$i]->getFamilyTicketPrice(), true), 2, '.', '')}</p>
                                    <button onclick="minus_family({$i})" style="width: 35px; height: 35px; border-radius: 50%; background-color: #000000; border:none; font-size: 20px; color: #FFFFFF; margin-left: 36px;">-</button>
                                        <input type=text disabled id="family_ticket{$i}" name=family value=0 style="border: none; background: none; display: inline-block; width: 35px; height: 35px; font-size: 25px; text-align: center; margin-top: 30px;">
                                    <button onclick="add_family({$i})" style="width: 35px; height: 35px; border-radius: 50%; background-color: #000000; border:none; font-size: 20px; color: #FFFFFF;">+</button>
                                </section>
                                <!--regular ticket-->
                                <section style="width:100%; height: 50px; display: block; margin-top: 10px; display: block;">
                                    <p style="font-size: 18px; display: inline-block; margin-left: 10px;">Regular Ticket (1 person) €{number_format((float)print_r($tickets[$i]->getRegularTicketPrice(), true), 2, '.', '')}</p>
                                    <button onclick="minus_regular({$i})" style="width: 35px; height: 35px; border-radius: 50%; background-color: #000000; border:none; font-size: 20px; color: #FFFFFF; margin-left: 30px;">-</button>
                                        <input type=text disabled id="regular_ticket{$i}" name=regular value=0 style="border: none; background: none; display: inline-block; width: 35px; height: 35px; font-size: 25px; text-align: center;">
                                    <button onclick="add_regular({$i})" style="width: 35px; height: 35px; border-radius: 50%; background-color: #000000; border:none; font-size: 20px; color: #FFFFFF;">+</button>
                                    
                                    <form method=POST style="margin-top: -20%; margin-left: 110%;">       
                                        <input type=hidden name=hidden_guide_name value='{print_r($tickets[$i]->getGuideName(), true)}'>
                                        <input type=hidden name=hidden_amount value='{print_r($tickets[$i]->getAmount(), true)}'>  
                                        <input type=hidden name=hidden_event_name value='{print_r($tickets[$i]->getEventName(), true)}'>  
                                        <input type=hidden name=hidden_date value='{print_r($tickets[$i]->getDate(), true)}'>  
                                        <input type=hidden name=hidden_language value='{print_r($tickets[$i]->getLanguage(), true)}'>  
                                        <input type=hidden name=hidden_regular_price id="regular_price" value='{print_r($tickets[$i]->getRegularTicketPrice(), true)}'>  
                                        <input type=hidden name=hidden_family_price id="family_price" value='{print_r($tickets[$i]->getFamilyTicketPrice(), true)}'>  
                                        <input type=hidden name=hidden_regular_amount id="regular_amount{$i}" value=0>
                                        <input type=hidden name=hidden_family_amount id="family_amount{$i}" value=0>
                                        <input type=hidden name=hidden_total_payment id="total_amount{$i}"> 
                                        <p style="width: 200px; font-size: 15px; text-align: center;"> *The items inside the cart will only last for 24 hours </p>
                                        <input type=submit name=add_ticket value="Add to cart" style="margin-left: 50px; font-family: Helvetica Neue; background-color: #000000; border-radius: 5%; width: 120px; height: 40px; color: #FFFFFF; border: none; font-size: 22px;">
                                    </form>
                                </section>
                                <!--total payment-->
                                <section style="display: block; height: 20px; border-top: 1px solid black; margin-left: 10px;">
                                    <p style="display: inline-block; width: 35%; font-size: 24px;">Total cost: </p>
                                    <section style="display: inline-block; width: 60%; text-align: right;">
                                        <p style="display: inline-block; font-size: 24px;">€</p>
                                        <input disabled type=text id="total_payment{$i}" style="display: inline-block; border: none; background: none; font-size: 24px; width: 23%;" value='{number_format((float)print_r(0, true), 2, '.', '')}'>
                                    </section>
                                </section>                               
                            </section>                          
                        </section> 
                        <section style="width: auto; height: 15px;"></section>                
                    </section>  
                    <section style="width: auto; height: 25px;"></section>                                    
                {/for}
            </section>
        
        </article>

        <!--this is used to prevent the form from resubmitting the users input-->
        <script>
        if (window.history.replaceState) 
            window.history.replaceState(null, null, window.location.href);
        </script>
        
        <!--this is used to update the total payment-->
        <script style="display: none;">{include file="js/dropDownMenuButtons.js"}</script>

    </section>
    <section style="width: 70%; height: 50px; display: block; margin-left: 15%; background-color: white;"> </section
</body>

{include file="{$layout}\\footer.tpl"}