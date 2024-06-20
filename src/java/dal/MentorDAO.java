/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Interns;


/**
 *
 * @author ADM
 */
public class MentorDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Interns> getAllInterns() {
    String query = "SELECT * FROM Interns;";
    List<Interns> list = new ArrayList<>();
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Interns ( rs.getString(1),
            rs.getString(2),
             rs.getString(3),
             rs.getString(4),
             rs.getString(5)));

           
        }
    } catch (Exception e){
        
    } 
   
    return list;
}
    public void deleteIntern(String pid){
        String query ="DELETE FROM Interns WHERE intern_id =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e){
        }
        
    }
    public void insertIntern (String internId, String userId,String projectCode,String mentorId,String positionCode){
        String query="INSERT INTO [dbo].[Interns]\n" +
"           ([user_id]\n" +
"           ,[project_code]\n" +
"           ,[mentor_id]\n" +
"           ,[position_code])\n" +
"     VALUES\n" +
"           (?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,internId);
            ps.setString(2,userId);
            ps.setString(3,projectCode);
            ps.setString(4,mentorId);
            ps.setString(5,positionCode);
                    
            
            ps.executeUpdate();
        } catch (Exception e){
        }
        
        
    }
    public List<Certificate> getListCertificate(String userId) {
        List<Certificate> list = new ArrayList<>();
        String query = "SELECT * FROM Certificate WHERE sender_id = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Certificate c = new Certificate(
                            rs.getInt("cer_id"), 
                            rs.getString("cer_name"),
                            rs.getDate("issue_date"),
                            rs.getString("cer_company"),
                            rs.getString("cer_img"),
                            rs.getString("cer_link"),
                            rs.getInt("intern_id"),
                            rs.getString("sender_id")
                    );
                    list.add(c);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int addCertificate(String cerName, Date issueDate, String cerCompany, String cerImg, String cerLink, int internId, String senderId) {
        String query = "INSERT INTO Certificate (cer_name, issue_date, cer_company, cer_img, cer_link, intern_id, sender_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, cerName);
            ps.setDate(2, (java.sql.Date) issueDate);
            ps.setString(3, cerCompany);
            ps.setString(4, cerImg);
            ps.setString(5, cerLink);
            ps.setInt(6, internId);
            ps.setString(7, senderId);

            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Certificate getCertificateById(int cerId) {
        String query = "SELECT * FROM Certificate WHERE cer_id = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, cerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Certificate(
                            rs.getInt("cer_id"), 
                            rs.getString("cer_name"),
                            rs.getDate("issue_date"),
                            rs.getString("cer_company"),
                            rs.getString("cer_img"),
                            rs.getString("cer_link"),
                            rs.getInt("intern_id"),
                            rs.getString("sender_id")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
public int editCertificate(int cerId, String cerName, Date issueDate, String cerCompany, String cerImg, String cerLink, int internId, String senderId) {
        String query = "UPDATE Certificate SET cer_name = ?, issue_date = ?, cer_company = ?, cer_img = ?, cer_link = ?, intern_id = ?, sender_id = ? WHERE cer_id = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, cerName);
            ps.setDate(2, (java.sql.Date) issueDate);
            ps.setString(3, cerCompany);
            ps.setString(4, cerImg);
            ps.setString(5, cerLink);
            ps.setInt(6, internId);
            ps.setString(7, senderId);
            ps.setInt(8, cerId);

            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public static void main(String[] args) {
        MentorDAO dao = new MentorDAO();
        List<Interns> list = dao.getAllInterns();
        for (Interns interns : list) {
            System.out.println(interns ); // In ra thông tin của mỗi đối tượng Intern
        }
    }
}
