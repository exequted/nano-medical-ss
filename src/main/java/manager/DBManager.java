package manager;

import org.apache.logging.log4j.Logger;
import service.PropertiesService;

import java.sql.*;

import static org.apache.logging.log4j.LogManager.getLogger;
import static service.PropertiesService.getPropertyByKey;
import static utility.ClassNameUtil.getClassName;

public class DBManager implements DataSourceManager<Connection>{

    private static final Logger LOGGER = getLogger(getClassName());
    private static DBManager ourInstance;

    static {
        try {
            ourInstance = new DBManager();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Connection connection;

    private DBManager() throws SQLException {
        initializeConnection();
    }

    public static DBManager getInstance() { return ourInstance; }

    public Connection getConnection() { return  this.connection; }

    public void initializeConnection() throws SQLException {
        LOGGER.info("Database initialization started");
        try {
            Class.forName(getPropertyByKey("db.classname"));
        } catch (ClassNotFoundException e) {
            LOGGER.error("Driver wasn't found", e);
        }

        String url = getPropertyByKey("db.url");
        String login = getPropertyByKey("db.login");
        String password = getPropertyByKey("db.password");

        connection = DriverManager.getConnection(url, login, password);
        LOGGER.info("Database started with params: {}, {}, {}", url, login, password);
    }
}
