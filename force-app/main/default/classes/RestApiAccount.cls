@RestResource(urlMapping='/Accounts/*')
global class RestApiAccount {
    @HttpGet
    global static Account getAccountById(){
     
        RestRequest request = RestContext.request; 
        
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
         /* https://dhn0000017s9pmau-dev-ed.develop.my.salesforce.com/services/apexrest/Accounts/003Hn00002cJlIOIA0   
            by using substrin we catch ID from request structure in URI. So we will use this Id to call the record from database
            and return to third party system...*/
        
        System.debug('accountId');
        
       Account result = [SELECT Name, AccountNumber, Phone, NumberOfEmployees FROM Account WHERE ID =: accountId];
        
        return result;
    }   
     @HttpPost 
    global static Account createAcc(String name, String accNumber, String phone, Integer numOfEmp){
        
        Account newAcc = new Account();
        
        newAcc.Name = name;
        newAcc.AccountNumber = accNumber; 
        newAcc.Phone = phone;
        newAcc.NumberOfEmployees = numOfEmp;
        
        insert newAcc;
        return newAcc;
    }
    @HttpPut
    global static ID upsertAcc(String name, String accNumber, String phone, Integer numOfEmp, String Id){
         Account acc= new Account();
         acc.Name= name;
        acc.AccountNumber=accNumber;
        acc.Phone= phone;
        acc.NumberOfEmployees= numOfEmp;
        acc.Id= id;
         
        upsert acc; //updates existing record if no record exist creates new one
        
        return acc.id;
            
        
    }
   //Delete 
	@HttpDelete
    global static void deleteAcc(){ //
        
         RestRequest request = RestContext.request; 
        
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        
      Account result = [SELECT Id, Name, AccountNumber, Phone, NumberOfEmployees FROM Account WHERE ID =: accountId];
        delete result;
    }
    
    
}
//Third party system will read account data one by one with Ids
//Create a restResource class and method to allow third party to read Account data