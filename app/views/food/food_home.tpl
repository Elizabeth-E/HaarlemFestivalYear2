{include file="{$layout}\\header.tpl"}

<!DOCTYPE html>
<html>
  <head>
    <title>Food Home page</title>
    <meta charset="utf-8"/>
	<link rel="stylesheet" href="style.css">
    </head>
  
  <body class="food-container">
  
		<!-- header (Image) -->
        <div class="food-headerimg ">
			<img src="img/food_event/u55.jpg">
	       <!-- header image text -->
			<img id="food-logoimg" class="food-logobg" src="img/food_event/u57.png"/>
       </div>

      <!-- inside background box -->
     <div id="food-inside-container">
	  	  <!-- Breadcrumbs -->
        <div id="food-breadcrumbs"> 
			<a href="#"  class="food-bread">Haarlem Festival</a>
			<span> > </span>
			<a href="#" class="food-bread active" ><b>Haarlem Food</b></a>
		</div>
	  	  <!-- welcome text -->
			<div id="food-wlc_txt">
					<h2> Haarlem The City Of Taste</h2>
					<p>Taste you favourite food with special discount only at Haarlem Festival!</p>
			</div>			

				<div class="food-row">
					<div class="food-column">
						<h3>Restaurant Specktakel</h3>
					<!-- 1st img (Image) -->

							<img id="food-restaurant-images" src="img/food_event/u129.jpg"/>

							<ul class="food-minimenu-list">
								<li>Special discount on</li></br>
								<li>- European</li>
								<li>- International</li>
								<li>- Asian Cuisine</li></br>
								<b><li>between 17:00 - 21:30 ONLY</li></b>
							</ul> 
							<a href="#" class="food-menu-btn">Menu</a>
							<a href="#" class="food-res-button">Reserve</a> 
					</div>
  
  
				<div class="food-column">
					<h3>Restaurant Ratatouille</h3>
	
						<img id="food-restaurant-images" src="img/food_event/2nd_img_u87.jpg"/>
	 
					<ul class="food-minimenu-list">
								<li>Special discount on</li></br>
								<li>- French</li>
								<li>- Fish &amp; seafood</li>
								<li>- European Cuisine</li></br>
								<b><li>between 17:00 - 23:00 ONLY</li></b>
							</ul> 
							<a href="#" class="food-menu-btn">Menu</a>
						<a href="#" class="food-res-button"> Reserve</a> 
				</div>
  
				<div class="food-column">
					<h3>Restaurant ML</h3>
	
					<img id="food-restaurant-images" src="img/food_event/3rd_img_u88.jpg"/>
							<ul class="food-minimenu-list">
								<li>Special discount on</li></br>
								<li>- Dutch</li>
								<li>- Fish &amp; seafood</li>
								<li>- European Cuisine</li></br>
								<b><li>between 17:00 - 21:00 ONLY</li></b>
							</ul> 
						<a href="#" class="food-menu-btn">Menu</a>
						<a href="#" class="food-res-button">Reserve</a> 
				</div>
				
				<div class="food-column">
					<h3>Restaurant FRIS</h3>
	
					<img id="food-restaurant-images" src="img/food_event/u108.jpg"/>
	 
	
					<ul class="food-minimenu-list">
								<li>Special discount on</li></br>
								<li>- Dutc</li>
								<li>- French</li>
								<li>- European Cuisine</li></br>
								<b><li>between 17:00 - 22:00 ONLY</li></b>
							</ul> 
							<a href="#" class="food-menu-btn">Menu</a>
						<a href="#" class="food-res-button">Reserve</a> 
				</div>
  
				<div class="food-column second_line">
					<h3>Restaurant Mr. & Mrs.</h3>
	
					<img id="food-restaurant-images" src="img/food_event/1st_img_u86.png"/>
	 
					<ul class="food-minimenu-list">
								<li>Special discount on</li></br>
								<li>- Dutc</li>
								<li>- Fish &amp; seafood</li>
								<li>- European Cuisine</li></br>
								<b><li>between 18:00 - 22:30 ONLY</li></b>
							</ul> 
						<a href="#" class="food-menu-btn">Menu</a>
						<a href="#" class="food-res-button"> Reserve</a> 
				</div>
				
				<div class="food-column second_line">
					<h3>Grand Cafe Brinkman</h3>
	
					<img id="food-restaurant-images" src="img/food_event/u89.jpg"/>
	 
					<ul class="food-minimenu-list">
								<li>Special discount on</li></br>
								<li>- Dutc</li>
								<li>- European</li>
								<li>- Modern Cuisine</li></br>
								<b><li>between 17:00 - 21:00 ONLY</li></b>
							</ul> 
						<a href="#" class="food-menu-btn">Menu</a>
						<a href="#" class="food-res-button">Reserve</a> 
				</div>
				
				<div class="food-column second_line">
					<h3>Urban Frenchy Bistro</h3>
	
					<img id="food-restaurant-images" src="img/food_event/1st_img_u111.jpg"/>
	 
					<ul class="food-minimenu-list">
								<li>Special discount on</li></br>
								<li>- Dutc</li>
								<li>- Fish &amp; seafood</li>
								<li>- European Cuisine</li></br>
								<b><li>between 17:30 - 22:00 ONLY</li></b>
							</ul> 
						<a href="#" class="food-menu-btn">Menu</a>
						<a href="#" class="food-res-button"> Reserve</a> 
				</div>
  
					<div class="food-column second_line">
						<h3>The Golden Bull</h3>
	
						<img id="food-restaurant-images" src="img/food_event/u101.jpg"/>
	 
						<ul class="food-minimenu-list">
								<li>Special discount on</li></br>
								<li>- Steakhouse</li>
								<li>- Argentinian</li>
								<li>- European Cuisine</li></br>
								<b><li>between 17:30 - 22:00 ONLY</li></b>
							</ul> 
							<a href="#" class="food-menu-btn">Menu</a>
							<a href="#" class="food-res-button">Reserve</a> 
					</div>
  </body>

  {include file="{$layout}\\footer.tpl"}


  <style>

  body {
 margin:0px;
 height: 100%;
 font-family: Arial, Helvetica, sans-serif;
}
.food-container {
    background-color: lightgray;
	
}
.food-headerimg img{ 
    width: 100%;
} 

.food-headerimg img.grandcafe {
	height: 26em;
}

#food-logoimg {
  width:400px;
  height:350px;
  position:absolute;
  left:900px;
  top:5px;

}
img.food-logobg {
	background: rgba(192,192,192,0.5);
}
#food-inside-container {
  position:absolute;
  left:75px;
  top:360px;
  width:90%;
  height:auto;
  background-color:rgba(255, 255, 255, 1);
  margin-bottom:2%;
}
#food-breadcrumbs {
  width:600px;
  font-family:'Montserrat';
  margin:5px;
}
.food-bread {
	text-decoration:underline;
	color:#FF6600;
}
#food-wlc_txt {
  width:100%;
  text-align:center;
  position:absolute;

}
.food-res-button { 
	text-decoration: none; 
	text-align: center; 
	font-size: 15px; 
	background-color: orange; 
	color: white; 
	padding: 13px 32px; 
	margin: 0 2px 2px 25%; 
	cursor: pointer;
	border: none;
} 
.food-menu-btn {
	text-decoration: none; 
	text-align: center; 
	font-size: 15px; 
	background-color: black; 
	color: white; 
	padding: 10px 22px; 
	margin: -35% 12px 2px 25%; 
	cursor: pointer;
	float:right;
}

* {
  box-sizing: border-box;
}

/* Create four equal columns that floats next to each other */
.food-column {
  float: left;
  width: 20%;
  margin: 8% 20px 20px 3%;
  height: 420px; /* Should be removed. Only for demonstration */
  background-color:#ddd;
}
h3 {
	  text-align: center;
	  background-color: orange;
	  padding: 20px;
	  margin: 0px;
	  font-size: 20px;
}

/* Clear floats after the columns */
.food-row:after {
  content: "";
  display: table;
  clear: both;
}

.food-minimenu-list {
	font-weight:500;
	font-size:13px;
	margin-left: -10%;
	list-style-type:none;
	width:200px;
}
#food-restaurant-images {
  position:relative;
  width:266px;
  height:160px;
}

.second_line {
	  margin: 2% 20px 20px 3%;
}
.food-menutxt {
	text-align: center; 
	margin-top: 12%;
	color: black; 
	font-weight:2000;
}
#food-detail_txt{
	width:50%;
	text-align:center;
	position:absolute;
	margin-left:25%;
}
.food-flex-container {
  display: flex;
  flex-wrap: wrap;
  background-color:gray;
}

.food-flex-container > .menuimg {
	width:40%;
	margin: 10px;
	margin: 1% 0 0 7%;

}
.food-flex-container > .menu2 {
	width:40%;
	margin: 10px;
	margin: -11.6% 0 0 7%;
}

.food-grid-container {
  display: grid;
  grid-template-columns: 150px 400px;
  grid-gap: 5%;
  background-color: lightgray;
  padding: 10px;
  width: 40%;
  margin-left:7%;
}

.food-grid-container > div {
  
  padding: 20px 0 0 0;
  font-size: 15px;
  margin-top: -15px;
  
}
/*.grid-container > li {
	list-style: none;
  text-align: center;
  padding: 20px 0 0 0;
  font-size: 20px;
  width: 100%;
  line-height: 1.5;
  line-height: normal;
} */
.res-button {
  cursor: pointer;
  margin: 1% 0 0 15%;
  width: 22%;
  height:10%;
}
.food-gallery {
	text-align: center; 
	color: black; 
	font-weight:2000;
}



div.gallery img {
  width: 100%;
  height: auto;
}

* {
  box-sizing: border-box;
   
}
.food-gallery {
	margin:0 6.5%;
}
.responsive {
  padding: 0 6px;
  float: left;
  width: 20%; 
  align:center;
}

@media only screen and (max-width: 700px) {
  .responsive {
    width: 49.99999%;
    margin: 6px 0;
  }
}

@media only screen and (max-width: 500px) {
  .responsive {
    width: 100%;
  }
}

.clearfix:after {
  content: "";
  display: table;
  clear: both;
}

</style>