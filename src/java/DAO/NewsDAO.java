/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.News;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Desktop
 */
public class NewsDAO extends dal.ConnectDB implements DAO<News> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    public List<News> getNewsBySearch(String searchValue) {
        String search = "%" + searchValue + "%";
        try {
            List listNews = new ArrayList<>();
            sql = "SELECT TOP (1000) [NewsID]\n" + "      ,[NewsTitle]\n" + "      ,[NewsImageDescription]\n" + "      ,[NewsContent]\n" + "      ,[DatePosted]\n" + "      ,[Description]\n" + "  FROM [RealClub].[dbo].[TeamNews]\n" + "  where NewsID like ? or NewsTitle like ?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            st.setString(
                1,
                search
            );
            st.setString(
                2,
                search
            );

            rs = st.executeQuery();

            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt(1));
                n.setNewsTitle(rs.getString(2));
                String images = rs.getString(3);
                n.setNewsImageDescription(images);
                String contents = rs.getString(4);
                n.setNewsContent(contents);
                Date sqlDate = rs.getDate(5);
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    n.setDatePosted(localDate);
                }
                n.setDescription(rs.getString(6));

                listNews.add(n);
            }
            return listNews;
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public List<News> getAll() {
        try {
            List listNews = new ArrayList<>();
            sql = "SELECT TOP (1000) [NewsID]\n" + "      ,[NewsTitle]\n" + "      ,[NewsImageDescription]\n" + "      ,[NewsContent]\n" + "      ,[DatePosted]\n" + ",[Description]" + "  FROM [RealClub].[dbo].[TeamNews]";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt(1));
                n.setNewsTitle(rs.getString(2));
                String images = rs.getString(3);
                n.setNewsImageDescription(images);
                String contents = rs.getString(4);
                n.setNewsContent(contents);
                Date sqlDate = rs.getDate(5);
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    n.setDatePosted(localDate);
                }
                n.setDescription(rs.getString(6));

                listNews.add(n);
            }
            return listNews;
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public Optional<News> get(int id) {
        try {
            News n = new News();
            sql = "SELECT TOP (1000) [NewsID]\n" + "      ,[NewsTitle]\n" + "      ,[NewsImageDescription]\n" + "      ,[NewsContent]\n" + "      ,[DatePosted]\n" + ",[Description]" + "  FROM [RealClub].[dbo].[TeamNews] where NewsID=?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );
            rs = st.executeQuery();

            while (rs.next()) {

                n.setNewsId(rs.getInt(1));
                n.setNewsTitle(rs.getString(2));
                String images = rs.getString(3);
                n.setNewsImageDescription(images);
                String contents = rs.getString(4);
                n.setNewsContent(contents);
                Date sqlDate = rs.getDate(5);
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    n.setDatePosted(localDate);
                }
                n.setDescription(rs.getString(6));
            }
            return Optional.of(n);
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public void save(News t) {
        try {
            News n = new News();
            sql = "INSERT INTO [dbo].[TeamNews] " + "([NewsTitle], [NewsImageDescription], [NewsContent], [DatePosted],[Description])" + "VALUES (?, ?, ?, ?, ?)";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            st.setString(
                1,
                t.getNewsTitle()
            );
            st.setString(
                2,
                t.getNewsImageDescription()
            );
            st.setString(
                3,
                t.getNewsContent()
            );
            st.setDate(
                4,
                java.sql.Date.valueOf(t.getDatePosted())
            );
            st.setString(
                5,
                t.getDescription()
            );
            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong");
            }

        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public void update(News t) {
        try {
            News n = new News();
            sql = "UPDATE [dbo].[TeamNews]\n" + "   SET [NewsTitle] = (?)\n" + "      ,[NewsImageDescription] = (?)\n" + "      ,[NewsContent] = (?)\n" + "      ,[DatePosted] = (?)\n" + ",[Description] = (?)" + " WHERE [NewsID]=?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            st.setString(
                1,
                t.getNewsTitle()
            );
            st.setString(
                2,
                t.getNewsImageDescription()
            );
            st.setString(
                3,
                t.getNewsContent()
            );
            st.setDate(
                4,
                java.sql.Date.valueOf(t.getDatePosted())
            );
            st.setString(
                5,
                t.getDescription()
            );
            st.setInt(
                6,
                t.getNewsId()
            );

            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong");
            }

        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void delete(int id) {
        try {
            News n = new News();
            sql = "DELETE FROM [dbo].[TeamNews]\n" + "      WHERE [NewsID]=?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
            st = con.prepareStatement(sql);
            st.setInt(
                1,
                id
            );

            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong");
            }

        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(
                    Level.SEVERE,
                    null,
                    ex
                );
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
