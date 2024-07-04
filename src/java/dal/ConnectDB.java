/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;

import static dal.DatabaseInfor.*;

/**
 * @author Desktop
 */
public class ConnectDB {
    private static ConnectDB instance;
    protected static Logger logger = Logger.getLogger(ConnectDB.class.getName());

    public static ConnectDB getInstance() {
        if (instance == null) {
            synchronized (ConnectDB.class) {
                if (instance == null) {
                    instance = new ConnectDB();
                }
            }
        }
        return instance;
    }
    //get instance of databse only one time

    public Connection openConnection() throws ClassNotFoundException {
        try {
            Class.forName(driverName);
            return DriverManager.getConnection(
                url,
                user,
                pass
            );
        } catch (SQLException ex) {
            logger.log(
                Level.SEVERE,
                ex.getMessage(),
                ex
            );
        }
        return null;
    }

    public void closeResources(
        Connection con,
        AutoCloseable... closeables
    ) {
        try {
            if (Objects.nonNull(closeables)) {
                for (AutoCloseable closeable : closeables) {
                    if (Objects.nonNull(closeable)) {
                        closeable.close();
                    }
                }
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception ex) {
            logger.log(
                Level.SEVERE,
                ex.getMessage(),
                ex
            );
        }
    }
}
