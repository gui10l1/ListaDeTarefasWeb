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
            PreparedStatement stmnt = conn.prepareStatement("select * from db_listadetarefas.tb_tarefas where id_usuario = ?");
            
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
    
    public static boolean inserirTarefa(Tarefa t){
        boolean sucesso = false;
        
        try(Connection conn = Conexao.abrirConexao()){
            PreparedStatement stmnt = conn.prepareStatement("INSERT INTO db_listadetarefas.tb_tarefas (des_assunto, id_usuario) values (?, ?)");
            
            stmnt.setString(1, t.getAssunto());
            stmnt.setInt(2, t.getIdUsuario());
            
            int linhas = stmnt.executeUpdate();
            
            if(linhas > 0){
                sucesso = true;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        
        return sucesso;
    }
    
    public static boolean finalizarTarefa(Tarefa t){
        boolean sucesso = false;
        
        try(Connection conn = Conexao.abrirConexao()){
            PreparedStatement stmnt = conn.prepareStatement("UPDATE db_listadetarefas.tb_tarefas SET sta_finalizada = true WHERE id_tarefa = ? and id_usuario = ?");
            
            stmnt.setInt(1, t.getId());
            stmnt.setInt(2, t.getIdUsuario());
            
            int linhas = stmnt.executeUpdate();
            
            if(linhas > 0){
                sucesso = true;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        
        return sucesso;
    }
    
    public static boolean removerTarefa(Tarefa t){
        boolean sucesso = false;
        
        try(Connection conn = Conexao.abrirConexao()){
            
            PreparedStatement stmnt = conn.prepareStatement("DELETE from db_listadetarefas.tb_tarefas WHERE id_usuario = ? and id_tarefa = ?");
            
            stmnt.setInt(1, t.getIdUsuario());
            stmnt.setInt(2, t.getId());
            
            int linhas = stmnt.executeUpdate();
            
            if(linhas > 0){
                sucesso = true;
            }
            
        } catch (SQLException e){
            e.printStackTrace();
        }
        
        return sucesso;
    }
}
