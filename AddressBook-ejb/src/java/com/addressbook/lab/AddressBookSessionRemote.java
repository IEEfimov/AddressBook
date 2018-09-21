/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.addressbook.lab;

import javax.ejb.Remote;

/**
 *
 * @author gonch
 */
@Remote
public interface AddressBookSessionRemote {

    public Address findEmailAddress(String firstName, String lastName);
    public Address[] showAllRecords();
    public void addEmailAddress(String firstName, String lastName, String email, String phone, String groupID);
    public void deleteEmailAddress(String[] id);

 
    
    
    
}
