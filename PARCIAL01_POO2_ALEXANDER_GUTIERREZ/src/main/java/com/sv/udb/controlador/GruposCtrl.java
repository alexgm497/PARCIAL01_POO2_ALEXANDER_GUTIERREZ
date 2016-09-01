/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sv.udb.controlador;

import com.sv.udb.modelo.Grupos;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author AlexGM
 */
public class GruposCtrl {
    public List<Grupos> consTodo() {
        List<Grupos> resp = new ArrayList<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("POOPU");
        EntityManager em = emf.createEntityManager();
        try {            
            final CriteriaBuilder cb = em.getCriteriaBuilder();
            final CriteriaQuery<Grupos> q = cb.createQuery(Grupos.class);
            final Root<Grupos> Acce = q.from(Grupos.class);
            q.select(Acce);
            List<Grupos> result = em.createQuery(q).getResultList();
            for (Grupos l : result) {
                resp.add(new Grupos(l.getCodiGrup(), l.getNombGrup(), l.getFechInicGrup(), l.getFechFinaGrup(), l.getHoraInicGrup(), l.getHoraFinaGrup()));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        em.close();
        emf.close();
        return resp;
    }
}
