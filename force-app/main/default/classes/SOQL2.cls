public class SOQL2 {
    //Example 8: Find the account name, account rating, number of employees 
//.. and contact name, contact department, contact title...
//.. and opportunity name, opportunity amount for every contact...

    public static void queryMethod2(){
        
        List<Contact> myCons = [SELECT Account.Name, Account.Rating, Account.NumberOfEmployees,
            Contact.Name, Contact.Department, Contact.Title,
            (SELECT Opportunity.Name, Opportunity.Amount FROM Opportunities)
            FROM Contact];
        
        //how to see main object details
        //how to see parent object details along with the main object
        for(Contact con : myCons){
            
            System.debug(con + ' => Account Name: ' + con.Account.Name + ' , Account Rating: ' + con.Account.Rating);
        }
        
        //How to see opportunity details (inner list)
        for(Contact c : myCons){
            
            for(Opportunity opp : c.Opportunities){
                
                System.debug('Opportunity Name: '+ opp.Name + ', Amount : '+ opp.Amount + ', Contact ID: ' + opp.ContactId);
            }
        }
                
    }
    

}