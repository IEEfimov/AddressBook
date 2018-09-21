/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.addressbook.lab;

import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author gonch
 */
@Stateless
@LocalBean
public class GroupsSession implements GroupsSessionRemote {

    @PersistenceContext(unitName = "AddressBook-ejbPU")
    private EntityManager em;

    @Override
    public Groups[] showAllGroups() {

        Query query = null;
        query = em.createNamedQuery("Groups.findAll");

        List groupes = query.getResultList();
        System.out.println("groupes=" + groupes.size());
        Groups[] res = new Groups[groupes.size()];
        for (int i = 0; i < res.length; i++) {
            res[i] = (Groups) groupes.get(i);
        }
        return res;
    }

    @Override
    public String findGroupName(String groupId) {
        Query query = null;
        Integer a = Integer.parseInt(groupId);
        query = em.createNamedQuery("Groups.findById");
        query.setParameter("id", a);

        List groups = query.getResultList();
        if (groups.size() > 0) {
            Groups temp = (Groups) groups.get(0);
            return temp.getName();
        } else {
            return null;
        }
    }
    
    
    @Override
    public void addNewGroup (String groupName)
    {
        Groups group = new Groups();
        group.setName(groupName);
        em.persist(group);
    }
}
