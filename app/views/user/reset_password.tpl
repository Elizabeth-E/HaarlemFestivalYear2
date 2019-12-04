{include file="{$layout}\\header.tpl"}


<main>

  <div class="wrapper">
      <h3>Reset Password</h3>
      <p>Request a password reset for an account based on email-address.</p>

      
      <form action="<?php echo base_url('userController.php/reset_password'); ?>" method="post">
       <p>
          <label for="exampleInputEmail">Email</label>
          <input type="email" placeholder="Email-address" name="email" required>
        </p>
        <p class="input-file-wrapper">
          <button type="button">Request Register</button>
       
          </p>
      </form>
    </div>


</main>

{include file="{$layout}\\footer.tpl"}

<style>
* {
  box-sizing: border-box;
}

body {
  padding-top: 1rem;
}

.wrapper {
  max-width: 700px;
  margin: 0 auto;
  padding: 1em;
  background: #f9f9f9;
  border: 1px solid #c1c1c1;
}

h3 {
  margin: 0;
}

input:focus,
textarea:focus {
  outline: 3px solid gold;
}

input,
textarea,
button {
  width: 100%;
  border: 1px solid #000;
}

.wrapper > * {
  padding: 1em;
}

form label {
  display: block;
}

form p {
  margin: 0;
}

button,
input,
textarea {
  padding: 1em;
}

button {
  background: lightgrey;
  width: 100%;
  border: 0;
}
button:hover, button:focus {
  background: gold;
  outline: 0;
}

form {
  display: grid;
  grid-template-columns: 2fr 1fr;
  grid-gap: 20px;
}
form p {
  grid-column: 1 / 2;
}

.input-file-wrapper {
  grid-column: 2 / 3;
  grid-row: 1 / 2;
  margin-top: 30px;
}

a {
  color: black;
}
</style>
