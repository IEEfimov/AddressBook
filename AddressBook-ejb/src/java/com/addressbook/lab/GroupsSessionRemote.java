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
public interface GroupsSessionRemote {

    public Groups[] showAllGroups();
    public void addNewGroup(String groupName);
    public String findGroupName(String groupId);
}
