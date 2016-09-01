/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sv.udb.controlador;

import com.sv.udb.modelo.Alumnos;
import com.sv.udb.modelo.Grupos;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
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
    public List<Alumnos> consByCodiGrup(int codiGrup) {
        List<Alumnos> resp = new ArrayList<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        try {
            Query query = em.createQuery("SELECT a FROM Alumnos a INNER JOIN GruposAlumnos ga ON ga.codiAlum = a.codi_Alum WHERE ga.codiGrup = :codiGrup", Grupos.class);
            Grupos obje = new Grupos(codiGrup);            
            query.setParameter("codiGrup", obje);
            List<Alumnos> result = query.getResultList();
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
    public Alumnos cons(int idAlum) {
        Alumnos resp = null;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Alumnos> query = em.createNamedQuery("Alumnos.findByCodiAlum", Alumnos.class);
            query.setParameter("codiAlum", idAlum);
            List<Alumnos> result = query.getResultList();
            for (Alumnos l : result) {
                resp = new Alumnos(l.getCodiAlum());
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        em.close();
        emf.close();
        return resp;
    }
}
