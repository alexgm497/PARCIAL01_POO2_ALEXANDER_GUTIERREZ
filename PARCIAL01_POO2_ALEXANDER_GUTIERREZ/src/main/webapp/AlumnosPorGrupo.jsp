<%-- 
    Document   : Accesos
    Created on : 08-24-2016, 08:36:12 PM
    Author     : Alexander José
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo Alumnos</title>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <nav class="teal lighten-2">
            <div class="nav-wrapper">
                <a href="index.jsp" class="brand-logo right">PARCIAL 1 - POO2</a>
                <ul id="nav-mobile" class="left hide-on-med-and-down">
                    <li><a href="Alumnos.jsp">Alumnos</a></li>
                    <li><a href="#">Grupo Alumnos</a></li>
                    <li><a href="AlumnosPorGrupo.jsp">Grupo Alumnos</a></li>
                </ul>
            </div>
        </nav>
        <br/>
        <br/>
        <br/>
        <br/>
        <div class="container">
            <center><h2 class="teal-text text-lighten-2">Alumnos por grupo</h2></center>
            <br/>
            <center><h3 class="teal-text text-lighten-2">${mensAlert}</h3></center>
            <br/>
            <div class="row">
                <form name="DatosForm" method="POST" action="AlumnosGrupoServ" class="col s12">
                    <jsp:useBean id="beanGrupCtrl" class="com.sv.udb.controlador.GruposCtrl" scope="page"/>                    
                    <div class="input-field col s12">                    
                        <select name="cmbGrup">
                            <c:forEach items="${beanGrupCtrl.consTodo()}" var="fila">
                                <c:choose>
                                    <c:when test="${fila.codiGrup == cmbGrup}">
                                        <option value="${fila.codiGrup}" selected>${fila.nombGrup}</option>                                      
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${fila.codiGrup}">${fila.nombGrup}</option>                                    
                                    </c:otherwise>
                                </c:choose>                                
                            </c:forEach>
                        </select>
                        <label for="cmbGrup">Seleccione un grupo:</label>
                    </div>
                    <div class="col s12">
                        <br/>
                        <center>
                            <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Consultar"/>
                        </center>
                        <br/>
                    </div>
                </form>
                <form method="POST" action="Reporte.jsp" class="col s12">
                    <input type="hidden" name="codigoGrupo" value="${codigoGrupo}"/>
                    <jsp:useBean id="beanAlumnosCtrl" class="com.sv.udb.controlador.AlumnosCtrl" scope="page"/>
                    <table border="1" class="striped">
                        <thead>
                            <tr>
                                <th class="card-panel teal lighten-2">Nombre</th>
                                <th class="card-panel teal lighten-2">Apellido</th>
                                <th class="card-panel teal lighten-2">Nacimiento</th>
                                <th class="card-panel teal lighten-2">Correo</th>
                                <th class="card-panel teal lighten-2">Teléfono</th>
                                <th class="card-panel teal lighten-2">Dirección</th>
                                <th class="card-panel teal lighten-2">Genero</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${beanAlumnosCtrl.consByCodiGrup(codigoDeGrupo)}" var="fila">
                                <tr>
                                    <td><c:out value="${fila.nombAlum}"></c:out></td>
                                    <td><c:out value="${fila.apelAlum}"></c:out></td>
                                    <td><c:out value="${fila.fechNaciAlum}"></c:out></td>
                                    <td><c:out value="${fila.mailAlum}"></c:out></td>
                                    <td><c:out value="${fila.teleAlum}"></c:out></td>
                                    <td><c:out value="${fila.direAlum}"></c:out></td>
                                    <td><c:out value="${fila.geneAlum}"></c:out></td>
                                    </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br/>
                    <div class="col s12">
                        <center>
                            <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Imprimir"/>
                        </center>
                    </div>
                    <br/>
                </form>                
            </div>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/materialize.js"></script>
        <script>
            $(document).ready(function() {
                $('select').material_select();
            });
        </script>
        <script>
            $('.datepicker').pickadate({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 100 // Creates a dropdown of 15 years to control year
            });
        </script>
    </body>
</html>
