function add_family(i)
{
    var id = "family_ticket" + i;
    var x = document.getElementById(id);

    if(x.value >= 0)
        x.value = parseInt(x.value, 10) + 1;

    updateTotalPayment(i);
}

function minus_family(i)
{
    var id = "family_ticket" + i;
    var x = document.getElementById(id);

    if(x.value > 0)
        x.value = parseInt(x.value, 10) - 1;

    updateTotalPayment(i);
}

function add_regular(i)
{
    var id = "regular_ticket" + i;
    var x = document.getElementById(id);

    if(x.value >= 0)
        x.value = parseInt(x.value, 10) + 1;

    updateTotalPayment(i);
}

function minus_regular(i)
{  
    var id = "regular_ticket" + i;
    var x = document.getElementById(id);

    if(x.value > 0)
        x.value = parseInt(x.value, 10) - 1;

    updateTotalPayment(i);
}

function updateTotalPayment(i)
{
    var regular_total = parseInt(document.getElementById("regular_ticket" + i).value, 10) * parseFloat(document.getElementById("regular_price").value);
    var family_total = parseInt(document.getElementById("family_ticket" + i).value, 10) * parseFloat(document.getElementById("family_price").value);
    
    document.getElementById("total_payment" + i).value = "€" + parseFloat(family_total + regular_total).toFixed(2);

    document.getElementById("reg_amount" + i).value = parseInt(document.getElementById("regular_ticket" + i).value, 10);
    document.getElementById("fam_amount" + i).value = parseInt(document.getElementById("family_ticket" + i).value, 10);
    document.getElementById("tot_amount" + i).value = document.getElementById("total_payment" + i).value;
}