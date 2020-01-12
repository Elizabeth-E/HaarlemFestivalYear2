{include file="{$layout}\\header.tpl"}

<main>
	<div name=home-page>
	    <ol class="breadcrumb">
            <li><a href="{$www}">Haarlem Festival</a></li>
        </ol>
		<h1 name=home-page-heading>{$page_title}</h1>

		<article name=home-page-article">
            <!--images for home page-->
            {foreach from=$home_images item=$image}
                <section name=home-image-position>           
                    <img name=home-image src={$image->getImagePath()}>

					{if strpos($image->getImageName(), 'Night') != false}
					    <a href="{$www}/night"><button name=home-image-name>{$image->getImageName()}</button></a>
					{else}
					    <a href="{$www}/{$image->getImageName()}"><button name=home-image-name>{$image->getImageName()}</button></a>
					{/if}
                </section>
            {/foreach}
			
		</article>
		
		<p name=home-page-space></p>
	</div>
</main>

{include file="{$layout}\\footer.tpl"}