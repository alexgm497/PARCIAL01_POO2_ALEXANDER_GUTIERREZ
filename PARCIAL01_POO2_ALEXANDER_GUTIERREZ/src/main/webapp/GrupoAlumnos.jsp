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
            <center><h2 class="teal-text text-lighten-2">Mantenimiento de grupo-alumnos</h2></center>
            <br/>
            <center><h3 class="teal-text text-lighten-2">${mensAlert}</h3></center>
            <br/>
            <div class="row">
                <form name="DatosForm" method="POST" action="GrupAlumServ" class="col s12">                    
                    <jsp:useBean id="beanAlumCtrl" class="com.sv.udb.controlador.AlumnosCtrl" scope="page"/>
                    <jsp:useBean id="beanGrupCtrl" class="com.sv.udb.controlador.GruposCtrl" scope="page"/>
                    <input type="hidden" name="codiGrupAlum" value="${codiGrupAlum}"/>
                    <div class="input-field col s6">                    
                        <select name="cmbAlum">
                            <c:forEach items="${beanAlumCtrl.consTodo()}" var="fila">
                                <c:choose>
                                    <c:when test="${fila.codiAlum== cmbAlum}">
                                        <option value="${fila.codiAlum}" selected>${fila.nombAlum} ${fila.apelAlum}</option>                                      
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${fila.codiAlum}">${fila.nombAlum} ${fila.apelAlum}</option>                                      
                                    </c:otherwise>
                                </c:choose>                                
                            </c:forEach>
                        </select>
                        <label for="cmbAlum">Alumno:</label>
                    </div>
                    <div class="input-field col s6">                    
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
                        <label for="cmbGrup">Grupo:</label>
                    </div>
                    <div class="col s12">
                        <br/>
                        <center>
                            <c:choose>
                                <c:when test="${opConsulta == 1}">
                                    <input class="btn waves-effect waves-light disabled" type="submit" name="cursBton" value="Guardar"/>                                     
                                </c:when>
                                <c:otherwise>
                                    <input class="btn waves-effect waves-light" type="submit" name="cursBton" value="Guardar"/>                                                      
                                </c:otherwise>
                            </c:choose>
                        </center>
                        <br/>
                    </div>
                    
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
