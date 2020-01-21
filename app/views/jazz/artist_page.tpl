{include file="{$layout}\\header.tpl"}

<main>
	<section class="container">
        <ul class="nav nav-tabs" id="myTabs">
            <li role="presentation" data-toggle="tab" id="tab-home" class="active"><a href="#">Artist</a></li>
            <li role="presentation" data-toggle="tab" id="tab-tickets"><a href="#">Tickets</a></li>
            <li role="presentation" data-toggle="tab" id="tab-timetable"><a href="#">Timetable</a></li>
        </ul>

            <section class="container jazz">
                <div id="tab-content"><!-- Will be filled by JS --></div>
            </section>

    </section>

   <script>
// Bypass Smartry Literal
var baseUrl = '{$www}';
var param = "{$artistPage}";
{literal}

$('#tab-content').load(baseUrl + param);

//javascript for using tabs 
$('#myTabs a').click(function (e) {
    e.preventDefault();

    var tabId = $(this).parent().attr('id');

    switch(tabId) {
        case 'tab-home':
            $('#tab-content').load(baseUrl + param);
            break;
        case 'tab-tickets':
            $('#tab-content').load(baseUrl + '/jazz/tickets_ajax');
            break;
        case 'tab-timetable':
            $('#tab-content').load(baseUrl + '/jazz/timetable_ajax');
            break;
        default:
            $('#tab-content').load(baseUrl + param);
    }
    
    $(this).tab('show');
});


{/literal}
</script>

{include file="{$layout}\\footer.tpl"}