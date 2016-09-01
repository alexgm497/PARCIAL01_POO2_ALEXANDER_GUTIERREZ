/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sv.udb.controlador;

import com.sv.udb.modelo.Alumnos;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author AlexGM
 */
public class AlumnosCtrl {
    public boolean guar(Alumnos obje) {
        boolean resp = false;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        et.begin();
        try {
            em.persist(obje);
            et.commit();
            resp = true;
        } catch (Exception ex) {
            et.rollback();
            ex.printStackTrace();
        }
        em.close();
        emf.close();
        return resp;
    }
    public List<Alumnos> consTodo() {
        List<Alumnos> resp = new ArrayList<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        try {            
            final CriteriaBuilder cb = em.getCriteriaBuilder();
            final CriteriaQuery<Alumnos> q = cb.createQuery(Alumnos.class);
            final Root<Alumnos> Acce = q.from(Alumnos.class);
            q.select(Acce);
            List<Alumnos> result = em.createQuery(q).getResultList();
            SimpleDateFormat formatoDeFecha = new SimpleDateFormat("dd-MM-yyyy");
            for (Alumnos l : result) {
                resp.add(new Alumnos(l.getCodiAlum(), l.getNombAlum(), l.getApelAlum(), l.getFechNaciAlum(), l.getMailAlum(), l.getTeleAlum(), l.getDireAlum(), l.getGeneAlum()));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        em.close();
        emf.close();
        return resp;
    }
}