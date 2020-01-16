{include file="{$layout}\\header.tpl"}

<main>
	<div class="container">

		<h2 class="section-heading">Reset Password</h2>

		{if $tokenIsValid}
		<p>Reset your existing password.</p>
		<form method="post" action="<?php echo base_url('userController.php/reset_password_confirmation'); ?>">
			<div class="form-group">
				<label for="exampleInputPassword1">New Password</label>
				<input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Password">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword2">Confirm New Password</label>
				<input type="password" class="form-control" name="password_confirmation" id="exampleInputPassword2" placeholder="Password Confirmation">
			</div>
			<button type="submit" class="btn btn-default">Reset Password</button>
		</form>
		{/if}
	</div>
</main>

{include file="{$layout}\\footer.tpl"}