
package com.emergentes.controlador;

import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.dao.ProveedorDAO;
import com.emergentes.dao.ProveedorDAOimpl;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.Proveedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ProductoControlador", urlPatterns = {"/ProductoControlador"})
public class ProductoControlador extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        try {
            ProductoDAO dao = new ProductoDAOimpl();
            ProveedorDAO daoProveedor = new ProveedorDAOimpl();
            int id;
            List<Proveedor> lista_proveedores = null;
            Producto producto = new Producto();

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            System.out.println("El valor es _->"+action);
            switch (action) {
                case "add":
                    //
                    lista_proveedores = daoProveedor.getAll();
                    request.setAttribute("lista_proveedores", lista_proveedores);
                    request.setAttribute("producto", producto);
                    request.getRequestDispatcher("productonuevo.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    producto=dao.getById(id);
                    lista_proveedores = daoProveedor.getAll();
                    request.setAttribute("lista_proveedores", lista_proveedores);
                    request.setAttribute("producto", producto);
                    request.getRequestDispatcher("productonuevo.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProductoControlador");
                    break;
                case "view":
                    //Obtener la lista de registros
                    List<Producto> lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("productolista.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error" + ex.getMessage());
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        int id = Integer.parseInt(request.getParameter("id"));
        int proveedor_id = Integer.parseInt(request.getParameter("proveedor_id"));
        String nombre = request.getParameter("nombre");
        int unidades =Integer.parseInt(request.getParameter("unidades"));
        float precio=Float.parseFloat(request.getParameter("precio"));
        String categoria = request.getParameter("categoria");
        
        System.out.println("el valor es "+ id+" "+proveedor_id);
        Producto producto = new Producto();

        producto.setId(id);
        producto.setProveedor_id(proveedor_id);
        producto.setNombre(nombre);
        producto.setUnidades(unidades);
        producto.setPrecio(precio);
        producto.setCategoria(categoria);
        

        if (id == 0) {
            
            ProductoDAO dao = new ProductoDAOimpl();
            try {
                //NUevo

                dao.insert(producto);
                response.sendRedirect("ProductoControlador");
            } catch (Exception ex) {
                System.out.println("Error al insertar"+ ex.getMessage());
            }
            
        } else {
            ProductoDAO dao = new ProductoDAOimpl();
            try {
                //Editar

                dao.update(producto);
                response.sendRedirect("ProductoControlador");
            } catch (Exception ex) {
                System.out.println("Error al actualizar"+ ex.getMessage());
            }
        }
        
    }

    

}
