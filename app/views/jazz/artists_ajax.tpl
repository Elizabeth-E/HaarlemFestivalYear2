        <ol class="breadcrumb">
            <li><a href="{$www}">Haarlem Festival</a></li>
            <li><a href="{$www}/Jazz">Haarlem Jazz</a></li>
            <li><a href="{$www}/jazz" class="active">Artists</a></li>
        </ol>
        
        <h2 class="section-heading">Featured Artists</h2>

        <!-- TODO: All images should be the same size -->
        {assign var=counter value=0}
        {foreach from=$artists key=i item=artist}
            {if $counter == 0}
            <div class="row">
            {/if}
                {assign var=counter value=$counter +1}
                <div class="col-lg-4">
                    <a class="artistlabel" href="{$www}/jazz/artist_page/{$artist.urlSafeArtistName}">
                        <div class="row">
                                <img src="{$www}{$artist.picture}" alt="{$artist.artist}" class="artistpichome">
                            </div>
                            <div class="row artist-img footer">
                                <div class="col-lg-12">
                                {$artist.artist}
                                </div>
                            </div>
                        </div>
                    </a>
                {if $counter == 3}
            </div>
                {$counter = 0}
            {/if}
        {/foreach}

        <div class="row">
            <div class="col-lg-offset-2 col-lg-4">
                <button type="button" class="btn btn-lg" id="tickets-button">Find Tickets</button>
            </div>
        </div>