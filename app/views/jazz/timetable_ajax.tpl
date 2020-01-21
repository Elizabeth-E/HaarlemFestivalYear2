
    <ol class="breadcrumb">
        <li><a href="{$www}">Haarlem Festival</a></li>
        <li><a href="{$www}/Jazz">Haarlem Jazz</a></li>
        <li><a href="#" class="active">Timetable</a></li>
    </ol>

<h2>Timetable</h2><table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Date</th>
      <th class="th-sm">Day</th>
      <th class="th-sm">Time</th>
      <th class="th-sm">Location</th>
      <th class="th-sm">Hall</th>
      <th class="th-sm">Artist</th>
      <th class="th-sm">Price</th>
    </tr>
  </thead>
  <tbody>
    {foreach from=$timeTable item=$event} 
    <tr>
      <td>{$event.date}</td>
      <td>{$event.day|escape}</td>
      <td>{$event.time}</td>
      <td>{$event.location|escape}</td>
      <td>{$event.hall|escape}</td>
      <td>{$event.artist|escape}</td>
      <td>&euro; {$event.price}</td>
    </tr>
    {/foreach}
  </tbody>

</table>

<script>
{literal}
$(document).ready(function () {
    $('#dtBasicExample').DataTable();
    $('.dataTables_length').addClass('bs-select');
});
{/literal}
</script>

<style>
table.dataTable thead .sorting:after,
table.dataTable thead .sorting:before,
table.dataTable thead .sorting_asc:after,
table.dataTable thead .sorting_asc:before,
table.dataTable thead .sorting_asc_disabled:after,
table.dataTable thead .sorting_asc_disabled:before,
table.dataTable thead .sorting_desc:after,
table.dataTable thead .sorting_desc:before,
table.dataTable thead .sorting_desc_disabled:after,
table.dataTable thead .sorting_desc_disabled:before {
bottom: .5em;
}
</style>