import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map.Entry;

import org.apache.jena.rdf.model.*;

public class Main 
{
	public static void main(String[] args)
	{
		
		// create an empty Model
		Model model = ModelFactory.createDefaultModel();

    	Connection conn = null;
    	 
		try {
			String dbURL = "jdbc:sqlserver://localhost:1433;instance=SQLEXPRESS";
			String user = "test_user";
			String pass = "password";
			conn = DriverManager.getConnection(dbURL, user, pass);
			conn.setCatalog("Test");
			
			for (String tableName : DatabaseInfoExtractor.getTableNames(conn)) 
			{
				HashMap<String, Property> propertyMap = DatabaseInfoExtractor.getPropertyMap(model, conn, tableName);
				
				String basicUrl = formatPrimaryUrl(conn, tableName);
				String primaryKey = getPrimaryKeyForUrl(conn,tableName);
				
				HashMap<String, String> foreignKeys = DatabaseInfoExtractor.getForeignKeys(conn, tableName);
				
				LinkedList<String> columns = DatabaseInfoExtractor.getColumnNames(conn, tableName);
				
				/*
				 * So I originally had these two lines to help reduce redundancy in the datastore, however, I realized
				 * that if someone wanted the value of primary or foreign keys, like the sid, the only way they would be able to get them would be to
				 * extract it from the URL. If you like the datastore being set up this way, feel free to remove all of this and the two commented 
				 * out lines below. If you want to see what it is like with these two lines, uncomment them and also uncomment 
				 * the same lines in getPropertyMap in DatabaseInfoExtractor.  
				 */
				//columns.removeAll(DatabaseInfoExtractor.getPrimaryKeys(conn, tableName));
		    	//columns.removeAll(foreignKeys.keySet());
		    	java.sql.ResultSet pkobjects = DatabaseInfoExtractor.findObject(conn,tableName,primaryKey);
		    	while(pkobjects.next()){
		    		String url = updateBasicUrlWithKey(basicUrl,pkobjects.getString(primaryKey),primaryKey);
		    		//System.out.println(url);
		    		Resource resource = model.createResource(url);
		    	
		    	for (String column : columns) 
		    	{
		    		java.sql.ResultSet rs =DatabaseInfoExtractor.findObject(conn,tableName,column,pkobjects.getString(primaryKey),primaryKey);
		    		while(rs.next()){
		    			resource.addProperty(propertyMap.get(column),rs.getString(column) );
		    		}
		    	}
		    	
		    	for (Entry<String, String> foreignKey : foreignKeys.entrySet())
		    	{
		    		resource.addProperty(propertyMap.get("FK" + foreignKey.getKey()), formatPrimaryUrl(conn, foreignKey.getValue()));
		    	}}}}
	 catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		printModel(model); 
		
		FileWriter writer = null;
		
		try {
			writer = new FileWriter(".\\asdf.rdf");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.write(writer);
	
	}

	/*
	 *  This is only temporary. You can probably find a better way to build the url. 
	 *  I would like to use a url to represent the primary keys of the table.
	 */
	private static String formatPrimaryUrl(Connection conn, String tableName)
			throws Exception, SQLException {
		String url = DatabaseInfoExtractor.getPrimaryKeyUrl(conn, tableName);
		//System.out.println(url);
		return url;
	}
	
	private static String updateBasicUrlWithKey(String basic, String replacement, String primaryKey){
		return basic.replaceFirst(primaryKey,replacement);
	}
	private static String getPrimaryKeyForUrl(Connection conn, String tableName) throws SQLException{
		return DatabaseInfoExtractor.getPrimaryKeys(conn, tableName).get(0);
	}

	private static void printModel(Model model) {
		// list the statements in the Model
		StmtIterator iter = model.listStatements();

		// print out the predicate, subject and object of each statement
		while (iter.hasNext()) {
		    Statement stmt      = iter.nextStatement();  // get next statement
		    Resource  subject   = stmt.getSubject();     // get the subject
		    Property  predicate = stmt.getPredicate();   // get the predicate
		    RDFNode   object    = stmt.getObject();      // get the object

		    System.out.print(subject.toString());
		    System.out.print(" " + predicate.toString() + " ");
		    if (object instanceof Resource) {
		       System.out.print(object.toString());
		    } else {
		        // object is a literal
		        System.out.print(" \"" + object.toString() + "\"");
		    }

		    System.out.println(" .");
		}
	}
}
