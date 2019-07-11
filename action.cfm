<style>
	#err
	{
		color: red;
	}
</style>

<div id="err">
<cfif #form.name# eq "" or not isDefined("form.name")>
	<cfoutput>Name is required<br></cfoutput>
	<a href="form.cfm">Go back</a>
	<cfabort>
</cfif>

<cfif not isDefined("form.age") or #form.age# lt 20 or #form.age# gt 80>
	<cfoutput>Age must be an integer between 20 and 80<br></cfoutput>
	<a href="form.cfm">Go back</a>
	<cfabort>
</cfif>

<cfif not isDefined("form.sex") or #form.sex# eq "">
	<cfoutput>Gender is required<br></cfoutput>
	<a href="form.cfm">Go back</a>
	<cfabort>
</cfif>

<cfif not isDefined("form.dob") or #form.dob# eq "">
	<cfoutput>Date of Birth is required<br></cfoutput>
	<a href="form.cfm">Go back</a>
	<cfabort>
</cfif>
</div>

<cfquery name="qinputstudent" datasource="testdb">
		insert into students (id, Name, Age, Sex, dob) 
		values(
		<cfqueryparam cfsqltype="cf_sql_int" value="#RandRange(0, 1000)#">,
		<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.name#">,
		<cfqueryparam cfsqltype="cf_sql_int" value="#form.age#">,
		<cfqueryparam cfsqltype="cf_sql_char" value="#form.sex#">,
		<cfqueryparam cfsqltype="cf_sql_date" value="#form.dob#">
		)
	</cfquery>

<cfoutput>Your input has been inserted.<br><a href="form.cfm">Go back</a><br><a href="8.1.cfm">Check database</a></cfoutput>
