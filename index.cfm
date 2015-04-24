<script type="text/javascript" src="/CFIDE/scripts/ajax/jquery/jquery.js"></script>
<cfajaxproxy cfc="DBUtils" jsclassname="dbUtils" >
<script>
	$(function(){
		$('.dsSelect').change( function() {
		  $(".tablesDiv").load("tables.cfm?dsName="+this.value);
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="mystyle.css">

<cfscript>
	adminObj = createObject("component","CFIDE.adminapi.administrator");
	adminObj.login("Adm1n$","admin");
	
	dsObj = createObject("component","CFIDE.adminapi.datasource");
	datasources = dsObj.getDatasources();
	writeOutput("<div class='dsList'>");
	writeOutput("<div class='dsName' id='dshead' ><font color=blue><b>DataSources</b></font></div>");
	writeOutput("<select class='dsSelect' id='dsSelect'>");
	writeOutput("<option value='-1' selected>Select One</option>");
	for(dsName in structKeyList(datasources)){
		writeOutput("<option value='#dsName#'>#dsName#</option>");
	}
	writeOutput("</select>");
	writeOutput("</div>");
</cfscript>

<div class="tablesDiv"></div>
<div class="dataDiv">
</div>