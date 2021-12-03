
package com.emergentes.dao;

import com.emergentes.modelo.Proveedor;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ProveedorDAOimpl extends ConexionDB implements ProveedorDAO {

    @Override
    public void insert(Proveedor producto) throws Exception {
       try {
            this.conectar();
            String sql="insert into proveedores (dni,nombre,direccion,telefono,web) values(?,?,?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, producto.getDni());
            ps.setString(2, producto.getNombre());
            ps.setString(3, producto.getDireccion());
            ps.setString(4, producto.getTelefono());
            ps.setString(5, producto.getWeb());
            
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Proveedor producto) throws Exception {
         try {
            this.conectar();
            String sql="UPDATE proveedores SET dni=?, nombre=?, direccion=?, telefono=?, web=? where id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, producto.getDni());
            ps.setString(2, producto.getNombre());
            ps.setString(3, producto.getDireccion());
            ps.setString(4, producto.getTelefono());
            ps.setString(5, producto.getWeb());
            ps.setInt(6, producto.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            String sql="DELETE FROM proveedores where id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Proveedor getById(int id) throws Exception {
        Proveedor prove= new Proveedor();
        try {
            this.conectar();
            String sql="SELECT  * FROM proveedores WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs =ps.executeQuery();
            if(rs.next()){
                prove.setId(rs.getInt("id"));
                prove.setDni(rs.getString("dni"));
                prove.setNombre(rs.getString("nombre"));
                prove.setDireccion(rs.getString("direccion"));
                prove.setTelefono(rs.getString("telefono"));
                prove.setWeb(rs.getString("web"));
            }
            
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
       return prove;
    }

    @Override
    public List<Proveedor> getAll() throws Exception {
        List<Proveedor> lista=null;
        try {
            this.conectar();
            String sql="SELECT  * FROM proveedores ";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs =ps.executeQuery();
            
            lista=new ArrayList<Proveedor>();
            while(rs.next()){
                Proveedor p= new Proveedor();
                p.setId(rs.getInt("id"));
                p.setDni(rs.getString("dni"));
                p.setNombre(rs.getString("nombre"));
                p.setDireccion(rs.getString("direccion"));
                p.setTelefono(rs.getString("telefono"));
                p.setWeb(rs.getString("web"));
                lista.add(p);
            }
            rs.close();
            ps.close();
            
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
       return lista;
    }
    
}
