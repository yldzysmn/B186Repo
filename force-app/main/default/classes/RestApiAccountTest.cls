@isTest
private class RestApiAccountTest {
    @isTest static void testGetAccById(){
        
    Id recId = createTestRecord(); //helper method returned Id of fake account record
                
        RestRequest request = new RestRequest();
        request.requestURI = 'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/' + recId;
        request.httpMethod = 'GET';
            
       RestContext.request =  request;
        
        Test.startTest();
        //call the method to test
        Account thisAcc = RestApiAccount.getAccountById();
        
        //verify the result
      System.assert(thisAcc!=null); //expecting  
      System.assertEquals('Test Acc',thisAcc.Name);  
        Test.stopTest();
    }
    
    
    
    //TEST FOR POST METHOD......
    @isTest static void testCreateAcc(){
        
        Test.startTest();
      Account fakeData = RestApiAccount.createAcc('Test Acc Name', 'ACC654654', '+132165468', 33);
        
      Account thisAcc = [SELECT Name, AccountNumber, Phone, NumberOfEmployees FROM Account WHERE Id =: fakeData.Id];
        System.assert(thisAcc!=null);
        System.assertEquals('Test Acc Name', thisAcc.Name);
        
        Test.stopTest();
    }
    
    
    
    
    
    //TEST FOR UPSERT
    @isTest static void testUpsertAcc(){
        Test.startTest();
        //when you send request without ID, new one will be created: this is testing for Insert
      ID accId = RestApiAccount.upsertAcc('Upsert Test for Create', 'ACTEST13213', '+193333', 55, null);
        System.assert(accId != null); //I expect Id of new record in return when we execute method for non-existing record
        
        
        //call inserted fake record from database to test update part on it.
    Account accToUpdate = [SELECT Id, Name, AccountNumber, NumberOfEmployees, Phone FROM Account WHERE Id=:accId];
        System.assert(accToUpdate != null);        
        System.assertEquals('Upsert Test for Create' , accToUpdate.Name);
        
        //test for update by using existing Id
      ID accId2 =  RestApiAccount.upsertAcc('Upsert Test for Create 1', 'ACTEST13213',  '+193333', 55, accId);
        System.assertEquals(accId, accId2);
        
        //check updated fake record from database additionally
        
     Account accToUpdate2  = [SELECT Id, Name, AccountNumber, NumberOfEmployees, Phone FROM Account WHERE ID=:accId2];
        System.assert(accToUpdate2 != null);
        System.assertEquals('Upsert Test for Create 1' , accToUpdate2.Name);
       Test.stopTest();
    }
    
    //Test for delete
    
    @isTest
    static void testDeleteAcc(){
        Id accIdToDel = createTestRecord();
            RestRequest request = new RestRequest();
        request.requestURI = 'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/' + accIdToDel;
        request.httpMethod = 'DELETE';
            
       RestContext.request =  request;
        Test.startTest();
        RestApiAccount.deleteAcc();
        Test.stopTest();
        List <Account> acc= [SELECT Id FROM Account WHERE Id =: accIdToDel];
        System.Assert(acc.size()==0);
    }
    
    
    //helper method to create account > will return Id
    static Id createTestRecord(){ //return Id
       
        Account accTest = new Account();
        
      //Name, AccountNumber, Phone, NumberOfEmployees
      accTest.Name = 'Test Acc';
      accTest.AccountNumber = 'AC799654';
      accTest.Phone = '+19894562222';
      accTest.NumberOfEmployees = 90; 
        insert accTest;
        
        return accTest.Id;
    }
    
}