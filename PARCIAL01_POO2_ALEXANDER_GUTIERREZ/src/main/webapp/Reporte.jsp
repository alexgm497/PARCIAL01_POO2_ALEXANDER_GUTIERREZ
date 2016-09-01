<%-- 
    Document   : Reporte
    Created on : 01-sep-2016, 16:40:33
    Author     : AlexGM
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="com.sv.udb.recursos.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte</title>
    </head>
    <body>
        <%
            Connection cn = new Conexion().getConn();
            File reportfile = new File(application.getRealPath("reportes/Reporte.jasper"));
            Map<String, Object>parameter = new HashMap<String, Object>();
            String Parametro = String.valueOf(request.getParameter("codigoGrupo") == null ? "0" : request.getParameter("codigoGrupo"));
            parameter.put("Grupo", new String(Parametro));
            byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, cn);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream output = response.getOutputStream();
            output.write(bytes, 0, bytes.length);
            output.flush();
            output.close();
        %>
    </body>
</html>
