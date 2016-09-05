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
        <title>Alumnos</title>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <nav class="teal lighten-2">
            <div class="nav-wrapper">
                <a href="index.jsp" class="brand-logo right">PARCIAL 1 - POO2</a>
                <ul id="nav-mobile" class="left hide-on-med-and-down">
                    <li><a href="#">Alumnos</a></li>
                    <li><a href="GrupoAlumnos.jsp">Grupo Alumnos</a></li>
                    <li><a href="AlumnosPorGrupo.jsp">Grupo Alumnos</a></li>
                </ul>
            </div>
        </nav>
        <br/>
        <br/>
        <br/>
        <br/>
        <div class="container">
            <center><h2 class="teal-text text-lighten-2">Mantenimiento de alumnos</h2></center>
            <br/>
            <center><h3 class="teal-text text-lighten-2">${mensAlert}</h3></center>
            <br/>
            <div class="row">
                <form name="DatosForm" method="POST" action="AlumnosServ" class="col s12">                    
                    <input type="hidden" name="codiAlum" value="${codiAlum}"/>
                    <div class="input-field col s6">
                        <input name="Nombre" type="text" class="validate" value="${Nombre}" required>
                        <label for="Nombre">Nombre:</label>
                    </div>
                    <div class="input-field col s6">
                        <input name="Apellidos" type="text" class="validate" value="${Apellidos}" required>
                        <label for="Apellidos">Apellidos:</label>
                    </div>
                    <div class="input-field col s6">
                        <label for="FechaNaci">Nacimiento:</label>
                        <input type="date" class="datepicker" id="FechaNac" name="FechaNaci" value="${FechaNaci}">
                    </div>
                    <div class="input-field col s6">
                        <input name="email" type="email" class="validate" value="${email}" required>
                        <label for="email">Email:</label>
                    </div>
                    <div class="input-field col s6">
                        <input name="Numero" type="number" class="validate" value="${Numero}" required>
                        <label for="Numero">Número:</label>
                    </div>
                    <div class="input-field col s6">
                        <input name="Direccion" type="text" class="validate" value="${Direccion}" required>
                        <label for="Direccion">Dirección:</label>
                    </div>
                    <div class="input-field col s6">
                        <select name="cmbGene">
                            <c:choose>
                                <c:when test="${'Masculino' == cmbGene}">
                                    <option value="M" selected>Masculino</option>                                      
                                </c:when>
                                <c:when test="${'Femenino' == cmbGene}">
                                    <option value="F" selected>Femenino</option>                                      
                                </c:when>
                                <c:otherwise>
                                    <option value="M">Masculino</option>  
                                    <option value="F">Femenino</option>                               
                                </c:otherwise>
                            </c:choose>
                        </select>
                        <label for="cmbGene">Genero:</label>
                    </div>
                    <div class="col s12">
                        <br/>
                        <center>
                            <c:choose>
                                <c:when test="${opConsulta == 1}">
                                    <input class="btn waves-effect waves-light disabled" type="submit" name="cursBton" value="Guardar"/>
                                    <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Modificar"/>
                                    <input class="btn waves-effect waves-light" type="submit" name="cursBton" onclick="return confirm('¿Desea borrar el dato?')" value="Eliminar"/>
                                    <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Cancelar"/>                                      
                                </c:when>
                                <c:otherwise>
                                    <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Guardar"/>
                                    <input class="btn waves-effect waves-light disabled" type="submit" name="cursBton" value="Modificar"/>
                                    <input class="btn waves-effect waves-light disabled" type="submit" name="cursBton" onclick="return confirm('¿Desea borrar el dato?')" value="Eliminar"/>
                                    <input class="btn waves-effect waves-light disabled" type="submit" name="cursBton" value="Cancelar"/>                                     
                                </c:otherwise>
                            </c:choose>
                        </center>
                        <br/>
                    </div>
                </form>
                <form name="TablaForm" method="POST" action="AlumnosServ" class="col s12">
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
                                <th class="card-panel teal lighten-2">--</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${beanAlumnosCtrl.consTodo()}" var="fila">
                                <tr>
                                    <td><c:out value="${fila.nombAlum}"></c:out></td>
                                    <td><c:out value="${fila.apelAlum}"></c:out></td>
                                    <td><c:out value="${fila.fechNaciAlum}"></c:out></td>
                                    <td><c:out value="${fila.mailAlum}"></c:out></td>
                                    <td><c:out value="${fila.teleAlum}"></c:out></td>
                                    <td><c:out value="${fila.direAlum}"></c:out></td>
                                    <td><c:out value="${fila.geneAlum}"></c:out></td>
                                    <td><p><input id="${fila.codiAlum}" type="radio" name="codiAlumRadi" value="${fila.codiAlum}"/><label for="${fila.codiAlum}"></label></p></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br/>
                    <div class="col s12">
                        <center>
                            <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Consultar"/>
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
