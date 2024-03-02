package Model;

import static Model.DatabaseInfo.DBURL;
import static Model.DatabaseInfo.DRIVERNAME;
import static Model.DatabaseInfo.PASSDB;
import static Model.DatabaseInfo.USERDB;
import java.sql.*;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PersonDB implements DatabaseInfo {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    /*public static Connection getConnect(){
        try{
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
                    DataSource ds = (DataSource) envContext.lookup("jdbc/mydb");
                    return ds.getConnection();
        } catch (SQLException | NamingException ex){
            System.out.println("Error: " + ex);
        }
        return null;
    }*/


    public static ArrayList<Person> listAll() {
        ArrayList<Person> list = new ArrayList<Person>();
        //Connection con = getConnect();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("Select *  from film ");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Person(rs.getString(1), rs.getString(2),rs.getString(3), rs.getString(4),rs.getString(5), rs.getString(6) ));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(PersonDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

   

    public static void main(String[] a) {
        ArrayList<Person> list = PersonDB.listAll();
        for (Person item : list) {
            System.out.println(item.toString());
        }
    }
    
//---------------------------------------------------------------------------

}
