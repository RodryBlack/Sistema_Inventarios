<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Nuevo Producto</title>

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
                        <i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PRODUCTO
                    </h3>
                    <p class="text-justify">
                        Rellene los campos para agregar un nuevo producto
                    </p>
                </div>

                <div class="container-fluid">
                    <ul class="full-box list-unstyled page-nav-tabs">
                        <li>
                            <a class="active" href="ProductoControlador?action=add"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PRODUCTOS</a>
                        </li>
                        <li>
                            <a href="ProductoControlador"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PRODUCTOS</a>
                        </li>
                        <li>
                            <a href="client-search.html"><i class="fas fa-search fa-fw"></i> &nbsp; BUSCAR PRODUCTOS</a>
                        </li>
                    </ul>	
                </div>

                <!-- Content here-->
                <div class="container-fluid">

                    <form action="ProductoControlador" class="form-neon" autocomplete="off" method="post">
                        <fieldset>
                            <legend><i class="far fa-plus-square"></i> &nbsp; Información Básica</legend>
                            <div class="container-fluid">
                                <div class="row">

                                    <input type="hidden" name="id" value="${producto.id}"/>

                                    <div class="mb-3">
                                        <label  >Proveedor</label>
                                        <select name="proveedor_id" class="form-control">
                                            <option value="">-- Seleccion --</option>
                                            <c:forEach var="item" items="${lista_proveedores}">
                                                <option value="${item.id}" <c:if test="${producto.proveedor_id==item.id}">
                                                        selected
                                                    </c:if>
                                                    >${item.nombre}</option>
                                            </c:forEach>

                                        </select>

                                    </div>
                                    <br>

                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label for="cliente_nombre" class="bmd-label-floating">Nombre</label>
                                            <input type="text"  class="form-control" name="nombre" value="${producto.nombre}" id="cliente_nombre" maxlength="40">
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4">
                                        <div class="form-group">
                                            <label for="cliente_direccion" class="bmd-label-floating">Unidades</label>
                                            <input type="text"  class="form-control" name="unidades" value="${producto.unidades}" id="cliente_direccion" maxlength="150">
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4">
                                        <div class="form-group">
                                            <label for="cliente_telefono" class="bmd-label-floating">Precio</label>
                                            <input type="text"  class="form-control" name="precio"  value="${producto.precio}" id="cliente_telefono" maxlength="20">
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4">
                                        <div class="form-group">
                                            <label for="cliente_apellido" class="bmd-label-floating">Categoria</label>
                                            <input type="text"  class="form-control" name="categoria" value="${producto.categoria}" id="cliente_apellido" maxlength="40">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </fieldset>
                        <br><br><br>
                        <p class="text-center" style="margin-top: 40px;">
                            <button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
                            &nbsp; &nbsp;
                            <button type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
                        </p>
                    </form>
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