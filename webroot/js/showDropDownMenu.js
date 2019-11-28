//This is used to show the drop-down menu of a single ticket
function showDropDown(i) 
{
    var dropdown_id = "showDropDown" + i;
    var x = document.getElementById(dropdown_id);
    
    if (x.style.display === "none") 
        x.style.display = "block";
    else 
        x.style.display = "none";
}

