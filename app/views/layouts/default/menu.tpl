<nav class="navbar navbar-default container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
            aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="{$www}">
            <img src="{$www}/img/brand.svg" width="100" height="100" alt="Home Brand">
        </a>
    </div>
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-left">
            <li><a href="{$www}/" class="active">Home</a></li>
            <li><a href="{$www}/">Dance</a></li>
            <li><a href="{$www}/jazz">Jazz</a></li>
            <li><a href="{$www}/food">Food</a></li>
            <li><a href="{$www}/">Historic</a></li>
            <li><a href="{$www}/night/">At Night</a></li>
        </ul>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="{$www}/">Tickets</a></li>
            <li><a href="{$www}/about">About</a></li>
            <li><a href="{$www}/">FAQ</a></li>
            {if $userId == null}
                <li><a href="{$www}/user/login">Sign In</a></li>
            {else}
                <li><a href="{$www}/user/logout">Logout</a></li>
            {/if}
            <li>{include file="cart/cartButton.tpl"}</li>
            <li><a href="{$www}">EN/NL</a></li>         
        </ul>
    </div>
</nav>
<section id="showCart" class=cart-position>{include file="cart/cart.tpl"}</section>