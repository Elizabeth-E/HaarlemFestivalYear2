{include file="{$layout}\\header.tpl"}

<!DOCTYPE html>
<html>
<head>
   <title>{$title}</title>
</head>
<body>



  <div class="wrapper">
      <h3>Register Here</h3>
      <form action="register" method="post">
        
        <p>
          <label for="email">Email</label>
          <input type="text" placeholder="Enter Email" name="email" required>
        </p>
        <p>
          <label for="username">User Name</label>
          <input type="text" placeholder="Enter Username" name="username" required>
        </p>
        <p>
          <label for="firstname">First Name</label>
          <input type="text" placeholder="Enter Firstname" name="firstname" required>
        </p>
        <p>
          <label for="lastname">Last Name</label>
          <input type="text" placeholder="Enter Lastname" name="lastname" required>
        </p>
        <p>
          <label for="password">Password</label>
          <input type="password" placeholder="Enter Password" name="password" required>
        </p>
        <p>
          <label for="password_confirmation"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="password_confirmation" required>
  </p>

  <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

        <p class="input-file-wrapper">
          <label>Login</label>
          <a href="login"><button type="button">Login</button>
        </a>
        </p>
        <p>
          <button type="submit">Register</button>
        </p>
      </form>
    </div>
</body>
</html>

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
}

a {
  color: black;
}

</style>
