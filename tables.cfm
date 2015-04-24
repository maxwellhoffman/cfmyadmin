<cfoutput>
<script>
	$('.tableSelect').change( function() {
	  $(".dataDiv").load("data.cfm?dsName=#URL.dsName#&tableName="+this.value);
	});
</script>
</cfoutput>
<cfscript>
dbUtils = createObject("component","DBUtils");
tables = dbUtils.getTables(#URL.dsName#);
writeOutput("<div class='tablesList'>");
writeOutput("<div class='tableName' id='tableshead' ><font color=blue><b>Tables</b></font></div>");
	writeOutput("<select class='tableSelect' id='tableSelect'>");
	writeOutput("<option value='-1' selected>Select One</option>");
	for(table in tables){
		writeOutput("<option value='#table.TABLE_NAME#'>#table.TABLE_NAME#</option>");
	}
	writeOutput("</select>");
writeOutput("</div>");
</cfscript>
