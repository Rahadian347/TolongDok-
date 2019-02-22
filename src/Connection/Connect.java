package Connection;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Rahadian
 */
import java.sql.*;
import javax.swing.*;
public class Connect {
     Connection con=null;
   
        public static Connection ConnectDB(){
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tolongDok_db","root","watchman");
                return con;
            } catch(ClassNotFoundException | SQLException e){
                JOptionPane.showMessageDialog(null, e);
                return null;
            }      
        }
}
