/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.addressbook.lab;

import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author gonch
 */
@Stateless
@LocalBean
public class AddressBookSession implements AddressBookSessionRemote {

    @PersistenceContext(unitName = "AddressBook-ejbPU")
    private EntityManager em;

    @Override
    public void deleteEmailAddress(String[] id)
    {  
        Query query = null;
        
        System.out.println(id.length);
        
//        if (id.length > 7)
//            System.out.println("good");
//        else
//            System.out.println("not good");
        
        for(int i = 0; i < id.length; i++)
        {
            System.out.println(id[i]);
            query = em.createNamedQuery("Address.findById");
            query.setParameter("id", Integer.parseInt(id[i]));
            em.remove(query);

        }
    }
    @Override
    public Address[] showAllRecords()
    {
        Query query = null;
        
        query = em.createNamedQuery("Address.findAll");
        List addresses = query.getResultList();
        Address[] res = new Address[addresses.size()];
        for (int i = 0; i < res.length; i++) {
            res[i] = (Address) addresses.get(i);
        }
        return res;
    }
    
    @Override
    public Address findEmailAddress(String firstName, String lastName) {
        
        Query query = null;
        
        if (!firstName.equals("") && !lastName.equals(""))
        {
        query = em.createNamedQuery("Address.findByFullname");
        query.setParameter("firstname", firstName);
        query.setParameter("lastname", lastName);
        }
        else if (!firstName.equals(""))
        {
            query = em.createNamedQuery("Address.findByFirstname");
            query.setParameter("firstname", firstName);
                    }
        else 
        {
        query = em.createNamedQuery("Address.findByLastname");
            query.setParameter("lastname", lastName);
        }
        
        List addresses = query.getResultList();
        if (addresses.size() > 0) {
            return (Address) addresses.get(0);
        } else {
            return null;
        }
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public void persist(Object object) {
        em.persist(object);
    }

    @Override
    public void addEmailAddress(String firstName, String lastName, String email,String phone, String groupID) {
        Integer group = Integer.parseInt(groupID);
        Address address = new Address();
        address.setFirstname(firstName);
        address.setLastname(lastName);
        address.setEmail(email);
        address.setPhone(phone);
        address.setGroupid(group);
        em.persist(address);
    }
    

}
