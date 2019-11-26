<script>
    function showCart() 
    {
        var x = document.getElementById("show");
    
        if (x.style.display === "none") 
            x.style.display = "block";
        else 
            x.style.display = "none";
    }
</script>
    
<button onclick="showCart()" style="margin-top: 4px; margin-left: 50px; width: 45px; height: 45px; background-color: white; border-radius: 50%;"></button>
<section id="show" style="display: none;">{include file="cart/cart.tpl"}</section>
