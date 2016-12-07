import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map.Entry;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Property;
 

public class DatabaseInfoExtractor 
{	
    public static void main(String[] args) {
    	Connection conn = null;
 
		try {
			String dbURL = "jdbc:sqlserver://localhost:1433";
			String user = "test_user";
			String pass = "password";
			conn = DriverManager.getConnection(dbURL, user, pass);
			conn.setCatalog("Test");
			
			Model model = ModelFactory.createDefaultModel();
			
			getPropertyMap(model, conn, "Taken");
			getPropertyMap(model, conn, "Student");
			
			//printPrimaryKeys(conn, "Taken");
			//printForeignKeys(conn, "Taken");
			//printTables(conn);
			//printColumns(conn, "Student");
			//System.out.println(getPrimaryKeyUrl(conn, "Taken", "www.example.org\\"));
		} catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public static LinkedList<String> getTableNames(Connection conn) throws SQLException {
		LinkedList<String> tables = new LinkedList<String>();
		
		DatabaseMetaData metaData = conn.getMetaData();
		String[] tableType = { "TABLE" };
		ResultSet tableResults = metaData.getTables(null, "dbo", null, tableType);

		while (tableResults.next()) 
		{
			String name = tableResults.getString("TABLE_NAME");
			
			if (!name.equals("sysdiagrams"))
				tables.add(name);
		}
		
		return tables;
	}
	
    public static LinkedList<String> getPrimaryKeys(Connection conn, String tableName) throws SQLException
	{
		LinkedList<String> primaryKeys = new LinkedList<>();
		
		ResultSet rs = conn.getMetaData().getPrimaryKeys(null, null, tableName);

		while(rs.next()) 
        {    
			primaryKeys.add((rs.getString("COLUMN_NAME")));
        }
		
		return primaryKeys;
	}
	
    /**
     * Looks at the given table, using the given connection, and finds the foreign keys that exist in the table.
     * A map, whose key is the foreign key's name and value is the table's name that it references, will be returned.
     * @param conn
     * @param tableName
     * @return
     * @throws SQLException
     */
    public static HashMap<String, String> getForeignKeys(Connection conn, String tableName) throws SQLException
	{
		HashMap<String, String> foreignKeys = new HashMap<String, String>();
		
		ResultSet rs = conn.getMetaData().getImportedKeys(null, null, tableName);

		while(rs.next()) 
        {    
			foreignKeys.put(rs.getString("FKCOLUMN_NAME"), rs.getString("PKTABLE_NAME"));
        }
		
		return foreignKeys;
	}
    
    public static LinkedList<String> getColumnNames(Connection conn, String tableName) throws SQLException
	{
		LinkedList<String> columns = new LinkedList<>();
		
		ResultSet rs = conn.getMetaData().getColumns(null, null, tableName, null);

		while(rs.next()) 
        {    
			columns.add((rs.getString("COLUMN_NAME")));
        }
		
		return columns;
	}

    public static String getPrimaryKeyUrl(Connection conn, String tableName) throws Exception
    {
    	return getPrimaryKeyUrl(conn, tableName, "http://www.example.org");
    }
    
    /**
     * Reason for using a url for primary keys: https://www.w3.org/2014/data-shapes/wiki/Primary_Keys_with_URI_Pattern
     * @param conn
     * @param tableName
     * @param resourceName
     * @return
     * @throws Exception
     */
    public static String getPrimaryKeyUrl(Connection conn, String tableName, String resourceName) throws Exception
    {
		String url = resourceName;
    	if (!url.endsWith("/"))
    		url += "/";
    	LinkedList<String> keys = getPrimaryKeys(conn, tableName);
    	
    	if (keys.size() == 0)
    		throw new Exception("The table given has no primary keys, so it cannot be given a unique identifier.");
    	
    	url += tableName;
    	
    	for (String key : keys) 
    	{
    		url += "-" + key;
		}
    	
    	//Need to remove the last - that will be added within the for loop.
    	
    	return url;
    }
    
    public static HashMap<String, Property> getPropertyMap(Model model, Connection conn, String tableName) throws SQLException
    {
    	String namespace = "http://example.org/" + conn.getCatalog() + "#";
    	
    	HashMap<String, Property> propertyMap = new HashMap<>();
    	
    	LinkedList<String> columns = getColumnNames(conn, tableName);
    	HashMap<String, String> foreignKeys = getForeignKeys(conn, tableName);
    	
    	//columns.removeAll(getPrimaryKeys(conn, tableName));
    	//columns.removeAll(foreignKeys.keySet());
    	
    	for (String columnName : columns) 
    	{
			Property tempProperty = model.createProperty(namespace + columnName);
			propertyMap.put(columnName, tempProperty);
		}
    	
    	for (Entry<String, String> foreignKey : foreignKeys.entrySet()) 
    	{
			String property = tableName + "-" + foreignKey.getValue();
			Property tempProperty = model.createProperty(namespace + property);
			propertyMap.put("FK" + foreignKey.getKey(), tempProperty);
		}
    	
    	model.setNsPrefix(conn.getCatalog(), namespace);
    	
    	return propertyMap;
    }
    
    public static void printColumns(Connection conn, String tableName) throws SQLException
    {
		for (String columnName : getColumnNames(conn, tableName)) {
			System.out.println(columnName);
		};
    }
    
	public static void printTables(Connection conn) throws SQLException
    {
		for (String tableName : getTableNames(conn)) {
			System.out.println(tableName);
		};
    }

	public static void printPrimaryKeys(Connection conn, String tableName) throws SQLException {
		for (String key : getPrimaryKeys(conn, tableName)) 
			System.out.println("Primary Key = " + key);
		
		System.out.println();
	}
	
	public static void printForeignKeys(Connection conn, String tableName) throws SQLException {
		for (Entry<String, String> entry : getForeignKeys(conn, tableName).entrySet()) 
		{
			System.out.println("Foreign Key = " + entry.getKey());
			System.out.println("What it references = " + entry.getValue());
		}
		
	}
	
}