package com.sopra.dao.impl;

import com.sopra.dao.StudenteDAO;
import com.sopra.model.Studente;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;



@Repository
@Transactional
public class StudenteDAOimpl implements StudenteDAO  {
    @Autowired
    private SessionFactory sessionFactory;
    private static final Logger logger = Logger.getLogger(StudenteDAOimpl.class);

    @Override
    public List<Studente> selectAll(){
        return getStudentList("SELECT * FROM studenti");
    }

    @Override
    public Studente selectById(int id){
        List<Studente> testList= getStudentList("SELECT * FROM studenti WHERE id = " + id );
        if (testList == null || testList.isEmpty())
        {logger.info("List is empty");
            return  null;}
        else
            logger.info(testList.get(0));
            return testList.get(0);
    }

    @Override
    public List<Studente> selectByFirstname(String nome){
        return getStudentList("SELECT * FROM studenti WHERE firstname = \"" + nome + "\"");
    }

    @Override
    public List<Studente> getStudentList(String query){

        logger.info(query);

        LinkedList<Studente> studenteList = null;
        try {
            String driver = "com.mysql.jdbc.Driver";
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e1) {
                e1.printStackTrace();
            }

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test?", "root" , "root");
            Statement cmd = con.createStatement();

            // query
            ResultSet res = cmd.executeQuery(query);


            studenteList = new LinkedList<>();

            while (res.next())
            {
                Studente temp = new Studente(res.getInt("id"), res.getString("firstname"), res.getString("lastname"));
                studenteList.add(temp);
                logger.debug("id: " + res.getInt("id"));
                logger.debug("firstname: " + res.getString("firstname"));
                logger.debug("lastname: " + res.getString("lastname"));
                logger.debug("----------------------------------");
            }


            res.close(); // chiudere le risorse DB è obbligatorio
            cmd.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return studenteList;
    }


    // -------------- HIBERNATE METHODS -------------------
    @Override
    public List<Studente> getAllStudentsHibernate(){
        logger.info((List<Studente>) sessionFactory.getCurrentSession().createQuery("FROM Studente").list());
        return  (List<Studente>) sessionFactory.getCurrentSession().createQuery("FROM Studente").list();
    }

//    String hql = "FROM Employee";
//    Query query = session.createQuery(hql);
//    List results = query.list();
//

    @Override
    public Studente getStudenteHibernate(int id) {
        logger.info(sessionFactory.getCurrentSession());
        return (Studente) sessionFactory.getCurrentSession().get(Studente.class, id);
    }
    @Override
    public List<Studente> getStudenteStringHibernate(String name){
        logger.info("get studente hib dao");
        return  null;

    }

}
