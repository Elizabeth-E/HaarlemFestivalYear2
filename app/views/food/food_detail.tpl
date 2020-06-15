{include file="{$layout}\\header.tpl"}

<section class=food-page>
    <section name=link-area>
        <a href="{$www}" class=link>Haarlem Festival</a>
        <p class=link-space>></p>
        <a href="{$www}/food/" class=link>Haarlem Food</a>
        <p class=link-space>></p>
        <p class=link-current>{$page_title_link}</p>
    </section>
    <h1>{$page_title}</h1>
    <article>

        <h2>{$description}</h2>
        <a href="{$www}/food/foodReservation/{$page_title}"><button>Reservation</button></a>

        <!--images of Restaurant menu-->
        <section id=food-menu-images>
            {foreach from=$food_images item=$image}             
                <section>
                    <img src={$image->getImagePath()}>                  
                </section> 
                <p></p>       
            {/foreach}
        </section>

        <p name=food-menu-space></p>
           
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
      text-align: center; 
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
        width: 200px; 
      height: 50px; border:none; 
      font-size: 14px; 
      background-color: #ED7D22; 
      color: #FFFFFF;
      margin-left: 35%;

  }
  
  .food-page h2
  {
      font-family: Helvetica Neue; 
      font-weight: 1; 
      width: 90%; 
      font-size: 26px;
      margin-left: 6%;
  }
  
  #food-menu-images
  {
      width: 100%; 
      height: 40%; 
      margin-left: 6%;
      display: inline-block;
  }
  
  #food-menu-images img
  {
      width: 240px; 
      height: 240px; 
      display: inline-block;
      margin-top: 10px;
  }
  #food-menu-images section
  {
    display: inline-block;
  }

  #food-menu-images p
  {
    width: 20px; 
    display: inline-block;
  }

  p[name=food-menu-space]
  {
    height: 250px;
  }
  </style>