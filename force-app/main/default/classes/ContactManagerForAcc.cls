//USE CASE1: Create an Apex Class; create two methods, in first method we need to create Task records
// ... for Account records without Contact....
//to be able to create Tasks in Account records, we need Accounts from database first.
// in second method return Accounts without child Contact from database. 
// 
// to be able to use Accounts returning from second method, execute second method in the first method... 
public class ContactManagerForAcc {
    //task creation for accounts
    public static void insertTaskForAcc(){
        
            List<Account> accListWithNoContact  = getAccounts();
              List<Task> taskList = new List<Task>();
        
                    for(Account acc : accListWithNoContact){
                        
                        Task newTask = new Task();
                        newTask.Description  = 'There is no contact in this account!';
                        newTask.Subject = 'Other';
                        newTask.WhatId = acc.Id;
                        
                        taskList.add(newTask);
                    }
        
          insert taskList;
        for(Task tk: taskList){
            System.debug(tk);
        }
        
    }
    
    
    
    //return accounts without contact from database
    public static List<Account> getAccounts(){
        
        List<Account> accounts = [SELECT Id, Name, Description,(SELECT Id FROM Contacts) FROM Account WHERE ID NOT IN (SELECT AccountId FROM Contact)];
        System.debug(accounts);
        
        return accounts;
    }
}