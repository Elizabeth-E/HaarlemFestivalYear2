
<section>
<h2>Tickets</h2>
    <section>
        <h3>All-Access Pass</h3>

            <div class = "container all-access col-lg-3">
                <p class = "all-access"> Thursday 26th July Pass &euro;35,-</p>
                <button type="button" class="btn btn-primary btn-lg jazz" data-toggle="modal" >Select Ticket </button>
            </div>
            <div class = "container all-access col-lg-3">
                <p class = "all-access"> Friday 27th July Pass &euro;35,-</p>
                <button type="button" class="btn btn-primary btn-lg jazz" data-toggle="modal" >Select Ticket </button>
            </div>
            <div class = "container all-access col-lg-3">
                <p class = "all-access"> Saturday 28th July Pass &euro;35,-</p>
                <button type="button" class="btn btn-primary btn-lg jazz" data-toggle="modal" >Select Ticket </button>
            </div>
            <div class = "container all-access col-lg-3">
                <p class = "all-access"> All Access Pass Thu, Fri, Sat &euro;80,-</p>
                <button type="button" class="btn btn-primary btn-lg jazz" data-toggle="modal">Select Ticket </button>
            </div>

    </section>
<section>
<h3>Single Tickets</h3>
    <section>
        <h3>Thursday 26th July</h3>
          {foreach from=$jul26 item=$event} 
          <div class = "container jazzticket col-lg-12">
            <div class = "jazzticket col-lg-10">
              <p class = "jazzticketp">{$event.artist|escape}</p>
              <p class = "jazzticketp">{$event.location|escape}-{$event.hall|escape}</p>
              <p class = "jazzticketp">{$event.time}</p>
                  
            </div>
            <div class = "jazzticket col-lg-2">
                  <p class = "jazzticketp">&euro; {$event.price}</p>
                  <button type="button" class="btn btn-primary btn-lg jazz" data-toggle="modal"> Select Ticket</button>
                  </div>
                  </div>
          {/foreach}
    </section>
    <section>
        <h3>Friday 27th July</h3>
          {foreach from=$jul27 item=$event} 
          <div class = "container jazzticket col-lg-12">
            <div class = "jazzticket col-lg-10">
              <p class = "jazzticketp">{$event.artist|escape}</p>
              <p class = "jazzticketp">{$event.location|escape}-{$event.hall|escape}</p>
              <p class = "jazzticketp">{$event.time}</p>
                  
            </div>
            <div class = "jazzticket col-lg-2">
                  <p class = "jazzticketp">&euro; {$event.price}</p>
                  <button type="button" class="btn btn-primary btn-lg jazz" data-toggle="modal"> Select Ticket</button>
                  </div>
                  </div>
          {/foreach}
    </section>
    <section>
        <h3>Sat 28th July</h3>
          {foreach from=$jul28 item=$event} 
          <div class = "container jazzticket col-lg-12">
            <div class = "jazzticket col-lg-10">
              <p class = "jazzticketp">{$event.artist|escape}</p>
              <p class = "jazzticketp">{$event.location|escape}-{$event.hall|escape}</p>
              <p class = "jazzticketp">{$event.time}</p>
                  
            </div>
            <div class = "jazzticket col-lg-2">
                  <p class = "jazzticketp">&euro; {$event.price}</p>
                  <button type="button" class="btn btn-primary btn-lg jazz" data-toggle="modal"> Select Ticket</button>
                  </div>
                  </div>
          {/foreach}
    </section>
    </section>
</section>
<!-- Modal -->
<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>