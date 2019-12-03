package classes;

import com.mysql.cj.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    private static Driver driver;

    private static void registrarDriver() {

        if (Conexao.driver == null) {

            try {
                Driver driver = new Driver();

                DriverManager.registerDriver(driver);

                Conexao.driver = driver;

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

    }

    public static Connection abrirConexao() throws SQLException {

        registrarDriver();

        return DriverManager.getConnection("jdbc:mysql://localhost:3306?useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

    }
}
