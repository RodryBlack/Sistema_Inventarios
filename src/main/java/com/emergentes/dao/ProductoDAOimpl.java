
package com.emergentes.dao;

import com.emergentes.modelo.Producto;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ProductoDAOimpl  extends ConexionDB implements ProductoDAO{

    @Override
    public void insert(Producto producto) throws Exception {
        try {
            this.conectar();
            String sql="insert into productos (proveedor_id, nombre,unidades,precio,categoria) values(?,?,?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1,producto.getProveedor_id());
            ps.setString(2, producto.getNombre());
            ps.setInt(3, producto.getUnidades());
            ps.setFloat(4, producto.getPrecio());
            ps.setString(5,producto.getCategoria());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Producto producto) throws Exception {
        try {
            this.conectar();
            String sql="UPDATE productos SET proveedor_id=?, nombre=?, unidades=?, precio=?,categoria=? where id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1,producto.getProveedor_id());
            ps.setString(2, producto.getNombre());
            ps.setInt(3, producto.getUnidades());
            ps.setFloat(4, producto.getPrecio());
            ps.setString(5, producto.getCategoria());
            
            ps.setInt(6,producto.getId());
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
            String sql="DELETE FROM productos where id = ?";
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
    public Producto getById(int id) throws Exception {
        Producto pro = new Producto();
       try {
            this.conectar();
            String sql="SELECT  * FROM productos WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs =ps.executeQuery();
            if(rs.next()){
                pro.setId(rs.getInt("id"));
                pro.setProveedor_id(rs.getInt("proveedor_id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setUnidades(rs.getInt("unidades"));
                pro.setPrecio(rs.getFloat("precio"));
                pro.setCategoria(rs.getString("categoria"));
            }
            
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
       return pro;
    }

    @Override
    public List<Producto> getAll() throws Exception {
        List<Producto> lista=null;
         try {
            this.conectar();
            String sql = "SELECT p.*, p2.nombre AS proveedor  FROM  productos p ";
            sql += "LEFT JOIN proveedores p2 ON p.proveedor_id=p2.id";
            

            PreparedStatement ps = this.conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Producto>();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("id"));
                p.setProveedor_id(rs.getInt("proveedor_id"));
                p.setNombre(rs.getString("nombre"));
                p.setUnidades(rs.getInt("unidades"));
                p.setPrecio(rs.getFloat("precio"));
                p.setCategoria(rs.getString("categoria"));
                p.setProveedor(rs.getString("proveedor"));
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
