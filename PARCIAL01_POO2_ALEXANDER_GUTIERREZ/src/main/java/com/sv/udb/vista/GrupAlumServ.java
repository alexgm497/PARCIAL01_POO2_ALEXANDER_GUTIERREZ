/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sv.udb.vista;

import com.sv.udb.controlador.AlumnosCtrl;
import com.sv.udb.controlador.GrupAlumCtrl;
import com.sv.udb.controlador.GruposCtrl;
import com.sv.udb.modelo.Alumnos;
import com.sv.udb.modelo.Grupos;
import com.sv.udb.modelo.GruposAlumnos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AlexGM
 */
@WebServlet(name = "GrupAlumServ", urlPatterns = {"/GrupAlumServ"})
public class GrupAlumServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         boolean esValido = request.getMethod().equals("POST");
        if (esValido) {
            String mens = "";
            String CRUD = request.getParameter("cursBton");
            switch (CRUD) {
                case "Guardar": {
                    GruposAlumnos obje = new GruposAlumnos();
                    Grupos obje2 = new GruposCtrl().cons(Integer.parseInt(request.getParameter("cmbGrup")));
                    Alumnos obje3 = new AlumnosCtrl().cons(Integer.parseInt(request.getParameter("cmbAlum")));
                    obje.setCodiGrup(obje2);
                    obje.setCodiAlum(obje3);
                    mens = new GrupAlumCtrl().guar(obje) ? "Datos guardados." : "Datos NO guardados.";
                    request.setAttribute("mensAlert", mens);
                    request.getRequestDispatcher("/GrupoAlumnos.jsp").forward(request, response);
                    break;
                }
                /*case "Consultar": {
                    int codiAcce = Integer.parseInt(request.getParameter("codiAcceRadi") == null ? "0" : request.getParameter("codiAcceRadi"));
                    LugaAcce obje = new LugaAcceCtrl().cons(codiAcce);
                    if (obje != null) {
                        request.setAttribute("codiAcce", obje.getCodiLugaAcce());
                        request.setAttribute("Nombre", obje.getNombLugaAcce());
                        request.setAttribute("opConsulta", 1);
                    }
                    request.setAttribute("mensAlert", mens);
                    request.getRequestDispatcher("/Accesos.jsp").forward(request, response);
                    break;
                }*/
                /*case "Modificar": {
                    String valor = request.getParameter("codiAcce");
                    if (!valor.equals("")) {
                        LugaAcce obje = new LugaAcce();
                        obje.setCodiLugaAcce(Long.parseLong(request.getParameter("codiAcce")));
                        obje.setNombLugaAcce(request.getParameter("Nombre"));
                        mens = new LugaAcceCtrl().actu(obje) ? "Datos modificados." : "Datos NO modificados.";
                    } else {
                        mens = "Seleccione un dato.";
                    }
                    request.setAttribute("mensAlert", mens);
                    request.getRequestDispatcher("/Accesos.jsp").forward(request, response);
                    break;
                }*/
                /*case "Eliminar": {
                    String valor = request.getParameter("codiAcce");
                    if (!valor.equals("")) {
                        LugaAcce obje = new LugaAcce();
                        obje.setCodiLugaAcce(Long.parseLong(request.getParameter("codiAcce")));
                        mens = new LugaAcceCtrl().elim(obje) ? "Datos eliminados." : "Datos NO eliminados.";
                    } else {
                        mens = "Seleccione un dato.";
                    }
                    request.setAttribute("mensAlert", mens);
                    request.getRequestDispatcher("/Accesos.jsp").forward(request, response);
                    break;
                }*/
                /*case "Cancelar": {
                    request.getRequestDispatcher("/Accesos.jsp").forward(request, response);
                    break;
                }*/
                default:
                    response.sendRedirect(request.getContextPath() + "/GrupoAlumnos.jsp");
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/GrupoAlumnos.jsp");        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
