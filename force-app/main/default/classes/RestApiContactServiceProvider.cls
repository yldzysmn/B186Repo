@RestResource(URLMapping='/contacts/')  //must be appended to end od endpoint as path parameter
global class RestApiContactServiceProvider {
    /*I will provide all contact records to external system
        @HttpGet
    global static List<Contact> getContactService(){ //request is coming from Postman, postman wants to get contact records
    List<Contact> contacts=[SELECT ID, FirstName, LastName, Phone, Email FROM Contact LIMIT 50];
    return contacts;
    }
 //we will return contact records to postman
 //so we need return type in @httpGet method. we can not use void
 //this is a non void method; because we will give something back to the requestor, so we need return type 
 //methods can be in 2 types void and non-void
 //non-void method  include 'return' keywork and data type in method creation line*/
    @HttpGet
    global static Contact provideContactRecsById(){
        RestRequest request= RestContext.request; //to be able to create value part of query parameter
        //catch the ID coming in request from Postman and find related contact record from database
       String contID= request.params.get('contactId'); //eneter key in get method and it returns value(ID)
        Contact con= [SELECT ID, FirstName, LastName, Phone, Email FROM Contact WHERE ID=: contId LIMIT 1];
        return con;
    } 
    //request.params.get('contactId'); in this part we define key part of query parameter
    //what we define here must be used in postman as key
    //btw you can give any name instead of "contactId"... but should summarize the functionality...
    
    //we will create structure to welcome the body coming from postman
   /* 
    @HttpPost
    global static Contact createContactService(Contact contFromPM){
        Contact newContact= new Contact();
        newContact.FirstName= contFromPM.FirstName;
        newContact.LastName= contFromPM.LastName;
        newContact.Phone= contFromPM.Phone;
        newContact.Email= contFromPM.Email;
        insert newContact;// insert is done into database
        
        return newContact; //as a response after contact inserted we will
        // return created contact to external system
        
    } */
    //post for multiple contacts
    @HttpPost
    global static List<Contact> postMultContact(List<Contact> contacts){
        List<Contact> newContact= new List<Contact>();
        for(Contact con: contacts){
            Contact contact= new Contact();
            contact.FirstName= con.FirstName;
            contact.LastName= con.LastName;
            contact.Phone= con.Phone;
            contact.Email= con.Email;
            newContact.add(contact);
            
        }
        insert newContact;
        return newContact;
    }
    
    @HttpPut
    global static Contact putContactService(Contact conToUpdate){
     // to be able to update call the record from database first using ID coming from Postman
       Contact updateExistingRec =[SELECT Id FROM Contact WHERE ID =: conToUpdate.Id LIMIT 1];
        updateExistingRec.FirstName = conToUpdate.FirstName;
        updateExistingRec.LastName = conToUpdate.LastName;
        updateExistingRec.Phone = conToUpdate.Phone;
        updateExistingRec.Email = conToUpdate.Email;
         update updateExistingRec;
        return updateExistingRec; //return updated version as a response to postman
        
        
    }    
    @HttpDelete
    global static void deleteContact(){
        RestRequest request= RestContext.request;
        String contID= request.params.get('contactId'); 
        Contact con= [SELECT ID, FirstName, LastName, Phone, Email FROM Contact WHERE ID=: contId LIMIT 1];
        delete con;
    }
    
}