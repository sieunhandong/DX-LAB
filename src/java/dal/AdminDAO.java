package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import models.Account;
import models.Role;

/**
 *
 * @author ADMIN
 */
public class AdminDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void createAccountCandidate(String user_id, String username, int role_id) {
        String query = "INSERT INTO Account (user_id, username, role_id, is_active) VALUES (?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user_id);
            ps.setString(2, username);
            ps.setInt(3, role_id);
            ps.setBoolean(4, true);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        } finally {
            closeResources();
        }
    }

    public void createAccountUser(String user_id, String username, int role_id, String full_name, Date dob, String gender, String phone_number, String avatar, String password) {
        String query = "INSERT INTO Account (user_id, username, password, full_name, dob, gender, phone_number, avatar, role_id, is_active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user_id);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, full_name);
            ps.setDate(5, new java.sql.Date(dob.getTime()));
            ps.setString(6, gender);
            ps.setString(7, phone_number);
            ps.setString(8, "img/" + avatar);
            ps.setInt(9, role_id);
            ps.setBoolean(10, true);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        } finally {
            closeResources();
        }
    }

    public Account getAccountByUsername(String username) {
        String query = "select * from Account where username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getByte(11));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        } finally {
            closeResources();
        }
        return null;
    }

    public List<Role> getAllRole() {
        List<Role> roles = new ArrayList<>();
        String query = "SELECT role_id, role_name FROM Role";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                roles.add(new Role(rs.getInt("role_id"), rs.getString("role_name")));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        } finally {
            closeResources();
        }
        return roles;
    }

    //METHOD to check Account is exists or not
    public boolean checkAccountExists(String user_id) {
        String query = "SELECT * FROM Account WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user_id);
            rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            return false;
        } finally {
            closeResources();
        }
    }

    // Sử dụng phương thức để lấy danh sách HR (Role_id = 3)
   public List<Account> getAllHR() {
       return getUsersByRoleId(3);
   }

   // Sử dụng phương thức để lấy danh sách Mentor (Role_id = 4)
   public List<Account> getAllMentor() {
       return getUsersByRoleId(4);
   }

   // Sử dụng phương thức để lấy danh sách Intern (Role_id = 5)
   public List<Account> getAllIntern() {
       return getUsersByRoleId(5);
   }

   // Sử dụng phương thức để lấy danh sách Candidate (Role_id = 6)
   public List<Account> getAllCandidate() {
       return getUsersByRoleId(6);
   }

   // Phương thức chung để lấy danh sách người dùng theo vai trò
   public List<Account> getUsersByRoleId(int roleId) {
       List<Account> list = new ArrayList<>();
       String query = "SELECT * FROM Account WHERE role_id = ?";
       try {
           conn = new DBContext().getConnection();
           ps = conn.prepareStatement(query);
           ps.setInt(1, roleId);
           rs = ps.executeQuery();
           while (rs.next()) {
               list.add(new Account(
                   rs.getString("user_id"),
                   rs.getString("username"),
                   rs.getString("password"),
                   rs.getString("full_name"),
                   rs.getDate("dob"),
                   rs.getString("gender"),
                   rs.getString("phone_number"),
                   rs.getString("avatar"),
                   rs.getString("specialization"),
                   rs.getInt("role_id"),
                   rs.getByte("is_active")
               ));
           }
       } catch (Exception e) {
           e.printStackTrace(); // Log the exception
       } finally {
           closeResources();
       }
       return list;
   }

       //METHOD to select all Account 
       public List<Account> getAllAccount() {
           List<Account> list = new ArrayList<>();
           String query = "SELECT * FROM Account";
           try {
               conn = new DBContext().getConnection();
               ps = conn.prepareStatement(query);
               rs = ps.executeQuery();
               while (rs.next()) {
                   list.add(new Account(rs.getString(1),
                           rs.getString(2),
                           rs.getString(3),
                           rs.getString(4),
                           rs.getDate(5),
                           rs.getString(6),
                           rs.getString(7),
                           rs.getString(8),
                           rs.getString(9),
                           rs.getInt(10),
                           rs.getByte(11)
                   ));
               }
           } catch (Exception e) {
               // Log the exception

           } finally {
               closeResources();
           }

           return list;
       }

    //METHOD search Account by username
    public List<Account> searchAccountByUsername(String username) {
        List<Account> accountList = new ArrayList<>(); // Danh sách kết quả tìm kiếm
        String query = "SELECT * FROM Account WHERE username LIKE ?";
        try {
            conn = new DBContext().getConnection();   // Lấy kết nối tới cơ sở dữ liệu từ DBContext
            ps = conn.prepareStatement(query);   // Chuẩn bị câu truy vấn
            ps.setString(1, "%" + username + "%");  // Thiết lập tham số cho câu truy vấn: %username%
            rs = ps.executeQuery(); // Thực thi truy vấn và lấy kết quả
            while (rs.next()) {
                accountList.add(new Account(
                        rs.getString("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getDate("dob"),
                        rs.getString("gender"),
                        rs.getString("phone_number"),
                        rs.getString("avatar"),
                        rs.getString("specialization"),
                        rs.getInt("role_id"),
                        rs.getByte("is_active")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        } finally {
            closeResources();
        }
        return accountList;
    }

    // Close resources to avoid memory leaks
    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
