<cfoutput>
<script>
	$("##executeQuery").click(function(event){
		//alert($("textarea##sql").val());
		$(".dataDiv").load("data.cfm?sql=" + encodeURIComponent($("textarea##sql").val()) + "&dsName=#URL.dsName#&tableName=#URL.tableName#");
	});
	$("##getAllData").click(function(event){
		//alert(this.id);
		$(".dataDiv").load("data.cfm?all=true&dsName=#URL.dsName#&tableName=#URL.tableName#");
	});
	
</script>
</cfoutput>
<div class="tableOptions">
	<textarea name="sql" id="sql" cols=50><cfoutput><cfif structKeyExists(URL, "sql")>#URL.sql#</cfif></cfoutput></textarea><br><br>
	<input type="button" name="getAllData" id="getAllData" value="Get All Data">
	<input type="button" name="executeQuery" id="executeQuery" value="Execute Query">
</div>
<br><br>
<cfscript>
dbUtils = createObject("component","DBUtils");
//writeDump(URL);
if(structkeyExists(URL, "sql")){
	result = dbUtils.executeQuery(URL.sql, URL.dsName);
}else if(structkeyExists(URL, "all")){
	result = dbUtils.getData(#URL.dsName#,#URL.tableName#);
}else{
	writeOutput("Columns<br>");
	result = dbUtils.getColumns(#URL.dsName#,#URL.tableName#);
}

writeDump(result);
</cfscript>
