		{if $alert == true}
			<!-- ALERT MESSAGE -->
			<div class="alert alert-{$alertType} alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<strong>{$alertType}!</strong> {$alertMessage}
			</div>
			<!-- ALERT MESSAGE -->
		{/if}