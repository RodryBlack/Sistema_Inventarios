<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Lista de Proveedores</title>

        <jsp:include page="WEB-INF/menu.jsp">
            <jsp:param name="" value=""/>
        </jsp:include>

    </head>
    <body>

        <!-- Main container -->
        <main class="full-box main-container">
            <!-- Page content -->
            <section class="full-box page-content">
                <nav class="full-box navbar-info">
                    <a href="#" class="float-left show-nav-lateral">
                        <i class="fas fa-exchange-alt"></i>
                    </a>
                    <a href="user-update.html">
                        <i class="fas fa-user-cog"></i>
                    </a>
                    <a href="#" class="btn-exit-system">
                        <i class="fas fa-power-off"></i>
                    </a>
                </nav>

                <!-- Page header -->
                <div class="full-box page-header">
                    <h3 class="text-left">
                        <i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PROVEEDORES
                    </h3>
                    <p class="text-justify">
                        Lista de proveedores registrados
                    </p>
                </div>

                <div class="container-fluid">
                    <ul class="full-box list-unstyled page-nav-tabs">
                        <li>
                            <a href="ProveedorControlador?action=add"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PROVEEDOR</a>
                        </li>
                        <li>
                            <a class="active" href="ProveedorControlador"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PROVEDORES</a>
                        </li>
                        <li>
                            <a href="client-search.html"><i class="fas fa-search fa-fw"></i> &nbsp; BUSCAR PROVEEDOR</a>
                        </li>
                    </ul>	
                </div>

                <!-- Content here-->
                <div class="container-fluid">
                    <div class="table-responsive">
                        <table class="table table-dark table-sm">
                            <thead>
                                <tr class="text-center roboto-medium">
                                    <th>#</th>
                                    <th>DNI</th>
                                    <th>NOMBRE</th>
                                    <th>DIRECCION</th>
                                    <th>TELEFONO</th>
                                    <th>PAGINA WEB</th>
                                    <th>ACTUALIZAR</th>
                                    <th>ELIMINAR</th>
                                </tr>
                            </thead>
                            <c:forEach var="item" items="${proveedores}">

                                <tr class="text-center" >
                                    <td>${item.id}</td>
                                    <td>${item.dni}</td>
                                    <td>${item.nombre}</td>
                                    <td>${item.direccion}</td>
                                    <td>${item.telefono}</td>
                                    <td>${item.web}</td>
                                    <td>
                                        <a href="ProveedorControlador?action=edit&id=${item.id}" class="btn btn-success">
                                            <i class="fas fa-sync-alt"></i>	
                                        </a>
                                    </td>
                                    

                                    <td><a href="ProveedorControlador?action=delete&id=${item.id}"  onclick="return(confirm('Esta seguro de Eliminar?'))"><i class="fas fa-trash-alt"></i></a></td>
                                    
                                </tr>
                            </c:forEach>

                        </table>
                    </div>

                </div>

            </section>
        </main>


        <!--=============================================
        =            Include JavaScript files           =
        ==============================================-->
        <!-- jQuery V3.4.1 -->
        <script src="./js/jquery-3.4.1.min.js" ></script>

        <!-- popper -->
        <script src="./js/popper.min.js" ></script>

        <!-- Bootstrap V4.3 -->
        <script src="./js/bootstrap.min.js" ></script>

        <!-- jQuery Custom Content Scroller V3.1.5 -->
        <script src="./js/jquery.mCustomScrollbar.concat.min.js" ></script>

        <!-- Bootstrap Material Design V4.0 -->
        <script src="./js/bootstrap-material-design.min.js" ></script>
        <script>$(document).ready(function () {
                $('body').bootstrapMaterialDesign();
            });</script>

        <script src="./js/main.js" ></script>
    </body>
</html>