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
			String dbURL = "jdbc:sqlserver://localhost:1433";
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
				
				LinkedList<Entry<String,String> > fkeys= new LinkedList<Entry<String,String>>();
				for(Entry<String,String> foreignKey: foreignKeys.entrySet()){
					fkeys.add(foreignKey);
				}
				
				LinkedList<String> pkeys = DatabaseInfoExtractor.getPrimaryKeys(conn, tableName);
				/*Query for table*/
				java.sql.Statement stmt = conn.createStatement();
				String query = "SELECT *"+ " FROM "+ tableName;
				java.sql.ResultSet rs = stmt.executeQuery(query);

				/*for each result set*/
				while(rs.next()){
					String url = basicUrl;
					for(int i =0; i< pkeys.size();i++){
						url = updateBasicUrlWithKey(url,rs.getString(pkeys.get(i)),pkeys.get(i));
					}
					Resource resource = model.createResource(url);
					/*for every column*/
					for(String column :columns){
						//If the column is a foreign key column, the value will automatically be added when we add the referencing object.
						if (!foreignKeys.keySet().contains(column))
							resource.addProperty(propertyMap.get(column), rs.getString(column));
					}
					/*for every fk relationship*/
					for(Entry<String,String> fk : fkeys){
						String objecturl =formatPrimaryUrl(conn, fk.getValue());
						objecturl = updateBasicUrlWithKey(objecturl, rs.getString(fk.getKey()),fk.getKey());
						
						resource.addProperty(propertyMap.get("FK" + fk.getKey()), model.getResource(objecturl));
					}
				}
			}
		}
		
				
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

	
	private static String formatPrimaryUrl(Connection conn, String tableName)
			throws Exception, SQLException {
		String url = DatabaseInfoExtractor.getPrimaryKeyUrl(conn, tableName);

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
