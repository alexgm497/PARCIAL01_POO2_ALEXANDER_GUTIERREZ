/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sv.udb.controlador;

import com.sv.udb.modelo.GruposAlumnos;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

/**
 *
 * @author AlexGM
 */
public class GrupAlumCtrl {
    public boolean guar(GruposAlumnos obje) {
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
}
