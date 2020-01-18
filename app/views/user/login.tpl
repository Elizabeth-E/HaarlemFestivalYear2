{include file="{$layout}\\header.tpl"}

<body class=" registeration-form">
	<div class="reg-container">
		<h1 class="reg">Account Registeration</h1>
			<div class="row_reg">
				<div class="column_reg" style="background-color:aliceblue;">
					<h5>Already a member?</h5>
    
				<form  method="post" id="signIn"  action="{$POST_URL}">
					<label for="email">Email</label>
					<input type="text" placeholder="Enter Email" name="email" required>
					<label for="password">Password</label>
					<input type="password" placeholder="Enter Password" name="password" required>
					<button type="submit" name=login_user>Login</button>
				</form>
					<button  id="ghost1" onclick="signInForm()">SignIn</button>
				</div>
  
			<div class="column_reg" style="background-color:lavender;">
				<h5>Not a member?</h5>
					<form method="post" id="signUp"  action="{$POST_URL}">
						<label for="email">Email</label>
						<input type="text" placeholder="Enter Email" name="email" required>
						<label for="username">User Name</label>
						<input type="text" placeholder="Enter Username" name="username" required>
						
						<label for="firstname">First Name</label>
						<input type="text" placeholder="Enter Firstname" name="firstname" required>
						<label for="lastname">Last Name</label>
						<input type="text" placeholder="Enter Lastname" name="lastname" required>
						<label for="password">Password</label>
						<input type="password" placeholder="Enter Password" name="password" required>
						<label for="password_confirmation"><b>Repeat Password</b></label>
						<input type="password" placeholder="Repeat Password" name="password_confirmation" required>
						<p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
						<button type="submit" name=register_user>Register</button>
                    </form>
     <button  type="submit"   id="ghost2" onclick="signUpForm()">SignUp</button>
  </div>
  </div>
  </div>
<script>
        var a = document.getElementById("signIn");
        var b = document.getElementById("signUp");
        var c = document.getElementById("ghost1");
        var d = document.getElementById("ghost2");

            a.style.display = "block";
            b.style.display = "none";
            c.style.display = "none";
            d.style.display = "block";

        function signInForm()
        {
        if (a.style.display === "none") 
        {
            a.style.display = "block";
            b.style.display = "none";
            c.style.display = "none";
            d.style.display = "block";
        } 
        }

        function signUpForm()
        {
        if (b.style.display === "none") 
        {
            b.style.display = "block";
            a.style.display = "none";
            c.style.display = "block";
            d.style.display = "none";
        } 
        }
</script>
</body>
  
{include file="{$layout}\\footer.tpl"}
<style>
/*Registeration*/
.registeration-form * {
    box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column_reg {
    float: left;
    width: 50%;
    padding: 10px;
    height: 750px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row_reg:after {
    content: "";
    display: table;
    clear: both;
}

.reg {
    text-align: center;
}

#signIn {
    display: flex;
    flex-direction: column;
    height: 100%;
}

input {
    width: 100%;
    padding: 12px 15px;
    margin: 2px 0;
}

button {
    border-radius: 20px;
    border: 1px;
    background-color: orange;
    color: #FFFFFF;
    font-size: 12px;
    font-weight: bold;
    padding: 12px 45px;
    letter-spacing: 1px;
    text-transform: uppercase;
    width: 50%;
    margin-left: 15em;
    margin-top: 2%;
}

.reg-container {
    background-color: grey;
    border-radius: 10px;
    position: relative;
    overflow: hidden;
    width: 768px;
    max-width: 100%;
    min-height: 480px;
    margin-left: 22%;
}

#ghost2 {
    border-radius: 20px;
    border: 1px;
    background-color: orange;
    color: #FFFFFF;
    font-size: 12px;
    font-weight: bold;
    padding: 12px 45px;
    letter-spacing: 1px;
    text-transform: uppercase;
    width: 100%;
    margin-top: 2%;
    margin-left: 2%;
}

#ghost1 {
    border-radius: 20px;
    border: 1px;
    background-color: orange;
    color: #FFFFFF;
    font-size: 12px;
    font-weight: bold;
    padding: 12px 45px;
    letter-spacing: 1px;
    text-transform: uppercase;
    width: 100%;
    margin-top: 2%;
    margin-left: 2%;
}
</style>