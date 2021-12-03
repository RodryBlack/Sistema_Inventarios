<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>Home</title>
        <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="" value=""/>
        </jsp:include>

</head>
<body>
	
	<!-- Main container -->
	<main class="full-box main-container">s
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
					<i class="fab fa-dashcube fa-fw"></i> &nbsp; TABLERO
				</h3>
				<p class="text-justify">
					BIENVENIDOS al SISTEMA DE INVENTARIOS por favor seleccione una ficha para realizar una accion
				</p>
			</div>
			
			<!-- Content -->
			<div class="full-box tile-container">

				<a href="ProveedorControlador" class="tile">
					<div class="tile-tittle">Proveedores</div>
					<div class="tile-icon">
						<i class="fas fa-users fa-fw"></i>
						<p></p>
					</div>
				</a>

				<a href="ProductoControlador" class="tile">
					<div class="tile-tittle">Productos</div>
					<div class="tile-icon">
						<i class="fas fa-pallet fa-fw"></i>
						<p></p>
					</div>
				</a>


				<a href="user-list.html" class="tile">
					<div class="tile-tittle">Usuarios</div>
					<div class="tile-icon">
						<i class="fas fa-user-secret fa-fw"></i>
						<p>50 Registrados</p>
					</div>
				</a>


				
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
	<script>$(document).ready(function() { $('body').bootstrapMaterialDesign(); });</script>

	<script src="./js/main.js" ></script>
</body>
</html>