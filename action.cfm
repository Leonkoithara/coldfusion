<cfif #form.name# eq "" or not isDefined("form.name")>
	<cfoutput>Name is required<br></cfoutput>
	<a href="form.html">Go back</a>
	<cfabort>
</cfif>

<cfif not isDefined("form.age") or #form.age# lt 20 or #form.age# gt 80>
	<cfoutput>Age is an integer between 20 and 80<br></cfoutput>
	<a href="form.html">Go back</a>
	<cfabort>
</cfif>

<cfif not isDefined("form.sex") or #form.sex# eq "">
	<cfoutput>Gender is required<br></cfoutput>
	<a href="form.html">Go back</a>
	<cfabort>
</cfif>

<cfif not isDefined("form.dob") or #form.dob# eq "">
	<cfoutput>Date of Birth is required<br></cfoutput>
	<a href="form.html">Go back</a>
	<cfabort>
</cfif>

<cfquery name="qinsertstudents" datasource="testdb">
	insert into students(id, Name, Age, Sex, DOB) values(#RandRange(1, 100)#, "#form.name#", "#form.age#", "#form.sex#", "#form.dob#")
</cfquery>

<cfoutput>Your input has been inserted.<br><a href="form.html">Go back</a></cfoutput>
