<script>
    //This is used to show the user which tickets they've selected
    function showCart() 
    {
        var x = document.getElementById("showCart");
    
        if (x.style.display === "none") 
            x.style.display = "block";
        else 
            x.style.display = "none";
    }
</script>
    
<!--if there is nothing in the cart, the button will be disabled until the user selects a ticket-->
{if $cart_count eq 0}
    <button disabled onclick="showCart()" name=cartButton>
        {$cart_count}
    </button>
{else}
    <button onclick="showCart()" name=cartButton style="background-color: #ED7D22; color: #FFFFFF;">
        {$cart_count}
    </button>
{/if}