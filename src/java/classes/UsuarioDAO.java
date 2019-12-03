package classes;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Usuario;

public class UsuarioDAO {
    
    public static boolean inserirUsuario(Usuario u){
        boolean sucesso = false;
        
        try (Connection conn = Conexao.abrirConexao()) {
            
            PreparedStatement stmnt = conn.prepareStatement("INSERT INTO db_listadetarefas.tb_usuarios (des_email, enc_senha) VALUES (?, ?)");
            
            stmnt.setString(1, u.getEmail());
            stmnt.setString(2, u.getSenha());
            
            int linhas = stmnt.executeUpdate();
            
            if(linhas > 0){
                sucesso = true;
            }
            
        } catch (SQLException e){
            e.printStackTrace();
        }
        
        return sucesso;
    }
    
    public static Usuario buscarUsuario(String email){
        Usuario u = null;
        
        try (Connection conn = Conexao.abrirConexao()) {
            PreparedStatement stmnt = conn.prepareStatement("select * from db_listadetarefas.tb_usuarios where des_email = ?");
            
            stmnt.setString(1, email);
            
            ResultSet rs = stmnt.executeQuery();
            
            while (rs.next()){
                int id = rs.getInt("id_usuario");
                String senha = rs.getString("enc_senha");
                
                u = new Usuario();
                u.setEmail(email);
                u.setSenha(senha);
                u.setId(id);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        
        return u;
    }
}
