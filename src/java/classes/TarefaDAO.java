package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.Tarefa;
import modelo.Usuario;

public class TarefaDAO {
    
    public static ArrayList<Tarefa> buscarTarefaDoUsusario(Usuario u){
        ArrayList<Tarefa> tarefas = new ArrayList();
        
        try(Connection conn = Conexao.abrirConexao()){
            PreparedStatement stmnt = conn.prepareStatement("select * from db_listadetarefas_tb_tarefas where id_usuario = ?");
            
            stmnt.setInt(1, u.getId());
            
            ResultSet rs = stmnt.executeQuery();
            
            
            while(rs.next()){
                String assunto = rs.getString("des_assunto");
                int id = rs.getInt("id_tarefa");
                boolean finalizada = rs.getBoolean("sta_finalizada");
                
                Tarefa t = new Tarefa();
                
                t.setAssunto(assunto);
                t.setFinalizada(finalizada);
                t.setId(id);
                t.setIdUsuario(u.getId());
                
                tarefas.add(t);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        
        return tarefas;
    }
}
