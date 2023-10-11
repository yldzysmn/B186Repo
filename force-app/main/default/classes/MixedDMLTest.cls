public class MixedDMLTest {
    
    public static void mDmlTest(String accName, String psName, String userName){
        
        //1.DML For an account
        //non-setup object
        
        MixedDMLTest.insertObject(accName);
        
            //2. DML for Permission Set Assignment
        
        //call permission set from database
      PermissionSet ps  = [SELECT Id, Name FROM PermissionSet WHERE Name=:psName];
        
        //call the user to which you assign ps
       User us = [SELECT Id, FirstName, UserName FROM User WHERE UserName =:userName];
        
        PermissionSetAssignment psa = new PermissionSetAssignment();
        //create an instance from PermissionSetAssignment setup object
        
        psa.AssigneeId = us.Id;
        psa.PermissionSetId = ps.Id;
        
        insert psa; //2. DML
        System.debug(psa);
        
    }
    
    @future
    public static void insertObject(String accName){
        Account acc = new Account();
        acc.Name = accName;
        insert acc; //1. DML
        System.debug(acc);
    }
}