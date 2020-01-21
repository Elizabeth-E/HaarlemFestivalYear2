{include file="{$layout}\\header.tpl"}

<section class=night-page>
    <section name=link-area>
            <a href="{$www}" class=link>Haarlem Festival</a>
            <p class=link-space>></p>
            <a href="{$www}/night/" class=link>Haarlem At Night</a>
            <p class=link-space>></p>
            <a href="{$www}/night/getTourPageInfo/{$tour_page}" class=link>{$tour_page}</a>
            <p class=link-space>></p>
            <p class=link-current>Tickets</p>
    </section>
    <h1>{$page_title}</h1>
    <article>
            
        <!--this display will be used to filter the tickets by selecting the language-->
        <section class=night-language-box>
            <form method=POST>
                <header>
			        <h3> Select your preferred language</h3>
			    </header>

                <section name=box>
                <!--filters the ticket if the user selects a langauge-->
                    {foreach from=$language_images item=$image}
                        <section class=night-language-info>
                            <img src={$image->getImagePath()}>
                            <input type=submit name=language value='{$image->getImageName()}'>
                        </section>
                    {/foreach}            
                </section>
                    
                <input type=submit name=language value='Show All Available Languages' id=night-language-all>
            </form>
        </section>

        <section class=night-all-ticket-display>
            <!--the tickets will be displayed here based on which tour the customer has selected-->
            {for $i=0 to $tickets|@count-1}
                <!--ticket-->
                <section class=night-ticket-display>
                    <section class=night-ticket>
                        <!--date-->
                        <section class=night-ticket-info>
                            <p>{print_r(date('l', strtotime($tickets[$i]->getDate())), true)}</p>
                            {print_r(date('jS F Y', strtotime($tickets[$i]->getDate())), true)}
                        </section>
                        <!--image of country flag with language-->
                        <section class=night-ticket-info>
                            {foreach from=$language_images item=$image}
                                {if $image->getImageName() == print_r($tickets[$i]->getLanguage(), true)}
                                    <img src={$image->getImagePath()}>
                                    <section name=language>{print_r($tickets[$i]->getLanguage(), true)}</section>
                                {/if}
                            {/foreach}                            
                        </section>
                        <!--time-->
                        <section class=night-ticket-info>
                            <p> Starts at: </p>
                            {print_r(date('H:i', strtotime($tickets[$i]->getDate())), true)}
                        </section>
                        <!--name of the guide-->
                        <section class=night-ticket-info>
                            <p> Guide: </p>
                            {print_r($tickets[$i]->getGuideName(), true)}
                        </section>                            
                    </section>
                    <!-- 'Select Ticket' button-->
                    <section class=night-ticket-select>                
                        <button onclick="showDropDown({$i})"> Select Ticket </button>
                        <script>{include file="js/showDropDownMenu.js"}</script>
                    </section>
                </section> 

                <!--Drop-down menu-->
                <section id="showDropDown{$i}" name=hide-showDropDown>
                    <section class=night-dropdown-display>
                        <section name=position>
                                
                            <!--family ticket-->
                            <section class=family-ticket-selection>
                                <p id=night-ticket-name>Family Ticket (4 people) €{number_format((float)print_r($tickets[$i]->getFamilyTicketPrice(), true), 2, '.', '')}</p>
                                <button onclick="minus_family({$i})" id=night-ticket-button-minus>-</button>
                                    <input type=text disabled id="family_ticket{$i}" name=family value=0>
                                <button onclick="add_family({$i})" id=night-ticket-button-plus>+</button>
                            </section>

                            <!--regular ticket-->
                            <section class=regular-ticket-selection>
                                <p id=night-ticket-name>Regular Ticket (1 person) €{number_format((float)print_r($tickets[$i]->getRegularTicketPrice(), true), 2, '.', '')}</p>             
                                <button onclick="minus_regular({$i})" id=night-ticket-button-minus-bottom>-</button>
                                    <input type=text disabled id="regular_ticket{$i}" name=regular value=0>
                                <button onclick="add_regular({$i})" id=night-ticket-button-plus>+</button>                                  
                                <form method=POST>       
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
                                    <p> *The items inside the cart will only last for 24 hours </p>
                                    <input type=submit name=add_ticket value="Add to cart">
                                </form>
                            </section>

                            <!--total payment-->
                            <section class=total-ticket>
                                <p>Total amount: </p>
                                <section>
                                    <p>€</p>
                                    <input disabled type=text id="total_payment{$i}" value='{number_format((float)print_r(0, true), 2, '.', '')}'>
                                </section>
                            </section>                               
                           
                        </section>                          
                    </section> 
                    <section name=night-ticket-first-space></section>                
                </section>  
                <section name=night-ticket-second-space></section>                                    
            {/for}
        </section>
        
    </article>

        <!--this is used to prevent the form from resubmitting the users input-->
    <script>
        if (window.history.replaceState) 
            window.history.replaceState(null, null, window.location.href);
    </script>
        
    <!--this is used to update the total payment-->
    <script>{include file="js/dropDownMenuButtons.js"}</script>

</section>

<section name=night-ticket-bottom-space></section>

{include file="{$layout}\\footer.tpl"}