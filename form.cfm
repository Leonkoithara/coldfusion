<html>
<head>
<title>Please Fill student details</title>
<script>
	function myTrim(x) 
	{
		return x.replace(/^\s+|\s+$/gm,'');
	}
	function validatename()
	{
		var x = document.forms["details_form"]["name"].value;
		x = myTrim(x);
		
		var req_text = document.getElementById("name_required");
		if(x == "")
		{
			req_text.style.visibility = "visible";
			return false;
		}
		else
		{
			req_text.style.visibility = "hidden";
			return true;
		}
	}
	function validateage()
	{
		var x = document.forms["details_form"]["age"].value;
		var req_text = document.getElementById("field_required");
		if(x < 20 || x > 80 || isNaN(x))
		{
			req_text.style.visibility = "visible";
			return false;
		}
		else
		{
			req_text.style.visibility = "hidden";
			return true;
		}
	}
	function validatedate()
	{
		var x = document.forms["details_form"]["dob"].value;
		x = x+"T17:14:00Z";
		var z = new Date(x);
		var y = document.forms["details_form"]["age"].value;
		var req_text = document.getElementById("invalid_date");
		
		var w = getAge(z);

		if(w != y)
		{
			req_text.style.visibility = "visible";
			return false;
		}
		else
		{
			req_text.style.visibility = "hidden";
			return true;
		}
	}

	function getAge(birthday) 
	{
	    var ageDifMs = Date.now() - birthday.getTime();
	    var ageDate = new Date(ageDifMs);

	    return Math.abs(ageDate.getUTCFullYear() - 1970);
	}
	
</script>
<br>
<h2>Enter Details</h2>
</head>

<hr style="border-color: blue">

<body style="padding: 15px;">
	<p>
	<form name="details_form" action="action.cfm" method="post">
		Name: <input name="name" type="text" onblur="validatename()">
		<div id="name_required" style="visibility: hidden; font-size: 75%; color: red;">Name is required</div><br>
		Age: <input name="age" type="text" onblur="validateage()"> 
		<div id="field_required" style="visibility: hidden; font-size: 75%; color: red;">Age must be an integer between 20 and 80</div><br>
		Sex: <br><input name="sex" type="radio"	value="M"> Male
			 <br><input name="sex" type="radio"	value="F"> Female
			 <br><input name="sex" type="radio"	value="O"> Other<br><br>
		Date of Birth: <input name="dob" type="date" required onblur="validatedate()">
		<div id="invalid_date" style="visibility: hidden; font-size: 75%; color: red;">Age and date of birth are inconsistent</div><br>
		<input name="sub" type="submit" value="Submit">
	</form>
	</p>
</body>
</html>
