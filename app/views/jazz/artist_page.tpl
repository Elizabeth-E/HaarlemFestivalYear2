{include file="{$layout}\\header.tpl"}

<main>
	<section class="container">
        <ul class="nav nav-tabs" id="myTabs">
            <li role="presentation" data-toggle="tab" id="tab-home" class="active"><a href="#">Home</a></li>
            <li role="presentation" data-toggle="tab" id="tab-tickets"><a href="#">Tickets</a></li>
            <li role="presentation" data-toggle="tab" id="tab-timetable"><a href="#">Timetable</a></li>
        </ul>
    <section>

    <section class="container jazz">
        <ol class="breadcrumb">
            <li><a href="{$www}">Haarlem Festival</a></li>
            <li><a href="{$www}/Jazz">Haarlem Jazz</a></li>
            <li><a href="{$www}/jazz">Artists</a></li>
            <li><a href="#" class="active">Artist name goes here</a></li>
        </ol>

        <div id="tab-content"><!-- Will be filled by JS --></div>

        <hr id="section-break" />
    </section>

    <!-- TODO: Move to homepage -->
    <section class="container jazz">

                <h1>artist page</h1>

    </sections>
	
</div>
</main>

<script>
// Bypass Smartry Literal
var baseUrl = '{$www}';
{literal}
$('#tab-content').load(baseUrl + '/jazz/artists_ajax');

//javascript for using tabs 
$('#myTabs a').click(function (e) {
    e.preventDefault();

    var tabId = $(this).parent().attr('id');

    switch(tabId) {
        case 'tab-home':
            $('#tab-content').load(baseUrl + '/jazz/artists_ajax');
            break;
        case 'tab-tickets':
            $('#tab-content').load(baseUrl + '/jazz/tickets_ajax');
            break;
        case 'tab-timetable':
            $('#tab-content').load(baseUrl + '/jazz/timetable_ajax');
            break;
        default:
            $('#tab-content').load(baseUrl + '/jazz/artists_ajax');
    }
    
    $(this).tab('show');
});


{include file="{$layout}\\footer.tpl"}