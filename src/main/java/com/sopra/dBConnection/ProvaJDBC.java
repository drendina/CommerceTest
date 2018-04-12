package com.sopra.dBConnection;

import org.apache.log4j.Logger;

import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;

public class ProvaJDBC{

    private static final Logger logger = Logger.getLogger(ProvaJDBC.class);

    public ProvaJDBC() {

    }
         // restituire lista di oggetti, scrivere una classe che rappresenta le entry e restituire una lista.
    public void useDB() {
        try {
            String driver = "com.mysql.jdbc.Driver";
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e1) {
                e1.printStackTrace();
            }

            String url = "jdbc:mysql:myDataSource";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test?", "root" , "root");
            Statement cmd = con.createStatement();
/*
           // creating table

            cmd.executeUpdate("DROP TABLE IF EXISTS studenti");
            cmd.executeUpdate("CREATE TABLE studenti " +
                   "(id INTEGER primary key auto_increment, " +
                   "firstname TEXT NOT NULL, " +
                   "lastname TEXT NOT NULL)");

            // insert records into table
            PreparedStatement preparedStatement;
            preparedStatement = con.prepareStatement("INSERT into studenti "+ "(firstname, lastname) values (?, ?)");

            preparedStatement.setString(1, "Mario");
            preparedStatement.setString(2, "Rossi");
            preparedStatement.execute();

            preparedStatement.setString(1, "Marco");
            preparedStatement.setString(2, "Bianchi");
            preparedStatement.execute();
*/
            // query
            ResultSet res = cmd.executeQuery("SELECT * FROM studenti");



            while (res.next())
            {
                logger.info("id: " + res.getString("id"));
                logger.info("firstname: " + res.getString("firstname"));
                logger.info("lastname: " + res.getString("lastname"));
                logger.info("----------------------------------");
            }


            res.close(); // chiudere le risorse DB è obbligatorio
            cmd.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
