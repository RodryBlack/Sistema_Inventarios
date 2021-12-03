
package com.emergentes.controlador;

import com.emergentes.dao.ProveedorDAO;
import com.emergentes.dao.ProveedorDAOimpl;
import com.emergentes.modelo.Proveedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ProveedorControlador", urlPatterns = {"/ProveedorControlador"})
public class ProveedorControlador extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         try{
            // para la adicion
            Proveedor pro= new Proveedor();
            //para edicion yeliminacion
           int id; 
           
            ProveedorDAO dao= new ProveedorDAOimpl();
            String action=(request.getParameter("action")!= null)? request.getParameter("action"): "view";
            
            switch (action){
                case "add":
                    
                    request.setAttribute("proveedor",pro);
                    request.getRequestDispatcher("proveedornuevo.jsp").forward(request, response);
                    break;
                case "edit":
                    id=Integer.parseInt(request.getParameter("id"));
                    pro=dao.getById(id);
                    request.setAttribute("proveedor", pro);
                    request.getRequestDispatcher("proveedornuevo.jsp").forward(request, response);
                    break;
                case "delete":
                    id=Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProveedorControlador");
                    break;
                case "view" :
                    //Obtener la lista de registros
                    List<Proveedor> lista =dao.getAll();
                    request.setAttribute("proveedores", lista);
                    request.getRequestDispatcher("proveedorlista.jsp").forward(request, response);
                    break;
            }
        }catch(Exception ex){
            System.out.println("Error" +ex.getMessage());
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id=Integer.parseInt(request.getParameter("id"));
        String dni=request.getParameter("dni"); 
        String nombre=request.getParameter("nombre");   
        String direccion=request.getParameter("direccion");
        String telefono=request.getParameter("telefono");
        String web=request.getParameter("web");
        
        
        Proveedor pro= new Proveedor();
        pro.setId(id);
        pro.setDni(dni);
        pro.setNombre(nombre);
        pro.setDireccion(direccion);
        pro.setTelefono(telefono);
        pro.setWeb(web);
        
        ProveedorDAO dao= new ProveedorDAOimpl();
        if(id==0){
            try {
                //nuevo Registro
                dao.insert(pro);
            } catch (Exception ex) {
                System.out.println("Error al insertar"+ex.getMessage());
            }
        }
        else{
            try {
                //Ediccion
                dao.update(pro);
            } catch (Exception ex) {
               System.out.println("Error al editar "+ex.getMessage()); 
            }
            
        }
        response.sendRedirect("ProveedorControlador");
    
    }

}
