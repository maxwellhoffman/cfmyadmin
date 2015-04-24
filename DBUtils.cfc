component{
	
	remote function getTables(string dsName){
		cfdbinfo(type="tables", datasource=dsName, name="tables");
		return tables;
	}
	
	remote function getColumns(string dsName, string tableName){
		cfdbinfo(type="columns", datasource=dsName, table=tableName, name="columns");
		return columns;
	}
	
	remote function getData(string dsName, string tableName){
		result = queryExecute("select * from #tableName#",[],{datasource=dsName});
		return result;
	}
	
	remote function executeQuery(string sql, string dsName){
		result = queryExecute(sql, [], {datasource=dsName});
		return result;
	}
}