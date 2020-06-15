{include file="{$layout}\\header.tpl"}

<section class=food-page>
    <section name=link-area>
        <a href="{$www}" class=link>Haarlem Festival</a>
        <p class=link-space>></p>
        <p class=link-current>Haarlem Food</p>
    </section>
    <h1>{$page_title}</h1>
    <article>

        <!--images for home page-->
        {foreach from=$restaurant_pages item=$page}
                <section class=food-home-restaurants>           
                    <section>
                        <h3>{$page[0]->getPageName()}</h3>
                       

                        <section name=image>
                        {foreach from=$page[1] item=$image}
                                <img src='{$image->getImagePath()}'>
                            {/foreach}
                          
                        </section>
                        <section name=info>
                        
                            <h4>{$page[0]->getPageDescription()}</h4>

                            <a href="{$www}/food/getPageInfo/{$page[0]->getPageName()}">

                            <button>Detail Page</button>
                             <br>

                            <a href="{$www}/food/foodReservation/{$page[0]->getPageName()}"><button name="reservation_button">Reservation</button></a>

                        </section>
                    </section>
                </section>
        {/foreach}

    </article>
</section>

{include file="{$layout}\\footer.tpl"}


<style>

.food-page
  {
      background-color: #FFFFFF; 
      width: 70%; 
      height: auto; 
      margin-left: 220px;
  }
  
  .food-page h1
  {
      text-aling:center; 
      font-family: Helvetica Neue; 
      font-weight: 1;
  }
  
  .food-page article
  {
      width: 70%; 
      height: 100%; 
      display: block; 
      margin-left: 15%;
  }
  
  .food-page article button
  {
      font-family: Helvetica Neue;
       width: 100px; 
      height: 30px; border:none; 
      font-size: 14px; 
      background-color: #ED7D22; 
      color: #FFFFFF;
      margin-left: 6%;
  }
  
  .food-page h2
  {
      font-family: Helvetica Neue; 
      font-weight: 1; 
      width: 90%; 
      font-size: 26px;
      margin-left: 6%;
  }
  
 
  
  .food-home-restaurants
  {
      width: auto; 
      height: 220px; 
      display: inline-block;

  }
  
  .food-home-restaurants section[name=info]
  {
      display: inline-block; 
      margin-left: 20px;
  }

  .food-home-restaurants h3
  {
  font-weight: 15;
    /*text-align: center;*/
    padding: 8px 10px;
    background-color: #ed7d22;
  }
  
  .food-home-restaurants section[name=info] h4
  {
      width: 400px; 
      display: inline-block;
  }
  
  .food-home-restaurants section[name=info] button
  {
      font-family: Helvetica Neue; 
      border: none;  
      background-color: black; 
      color: #FFFFFF; 
      display: block;
      margin-left: 50%;
      width:50%;
  }
  
  .food-home-restaurants section[name=image]
  {
      display: inline-block; 
      width: 200px;
  }
  
  .food-home-restaurants section[name=image] img
  {
      width: 200px; 
      height: 140px; 
      margin-top: -90px;
  }

  </style>