public class ContactRestCallOutFromTypicode {
    public static void getUserToCreateContact(String userId){
        Http http= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/users/' + userId);
        request.setMethod('GET');
        HttpResponse response= http.send(request);
        If (response.getStatusCode()==200){
            UserToContactParser myContact = UserToContactParser.parse(response.getBody());//convert from json to apex and assign into
                                                           // 'myContact' variable
            System.debug('Name of User' + myContact.name);
            System.debug('User Email' + myContact.email);
            System.debug('Company Name' + myContact.Company.name);
            System.debug('City' + myContact.Address.city);
            
           // lets create contact in salesforce..
           Contact con = new Contact();
            con.LastName= myContact.name;
            con.Email= myContact.email;
            con.MailingCity= myContact.Address.city;
            insert con;
        }
    }
    

}