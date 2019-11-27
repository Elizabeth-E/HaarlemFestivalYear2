<script>
    //This is used to show the user which tickets they've selected
    function showCart() 
    {
        var x = document.getElementById("show");
    
        if (x.style.display === "none") 
            x.style.display = "block";
        else 
            x.style.display = "none";
    }
</script>
    
<!--if there is nothing in the cart, the button will be disabled until the user selects a ticket-->
{if $cart_count eq 0}
    <button disabled onclick="showCart()" style="margin-top: 4px; margin-left: 50px; width: 45px; border: #ED7D22; height: 45px; background-color: white; border-radius: 50%;">
        {$cart_count}
    </button>
{else}
    <button onclick="showCart()" style="margin-top: 4px; margin-left: 50px; width: 45px; border: #FF8300; height: 45px; background-color: #ED7D22; border-radius: 50%;">
        {$cart_count}
    </button>
{/if}

<section id="show" style="display: none;">{include file="cart/cart.tpl"}</section>
