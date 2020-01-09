<nav class="navbar navbar-default navbar-fixed-top container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
            aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a href="{$www}" class="navbar-brand">Haarlem Festival</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="{$www}/">Jazz</a></li>
            <li><a href="{$www}/food">Food</a></li>
            <li><a href="{$www}/night/">At Night</a></li>
            <li><a href="{$www}/user/login">Login</a></li>
            <li><a href="{$www}/about/">About</a></li>
            <li>{include file="cart/cartButton.tpl"}</li>
            <li><a href="{$www}">EN/NL</a></li>
        </ul>
    </div>
</nav>
<section id="showCart" class=cart-position>{include file="cart/cart.tpl"}</section>