public class SOQL1 {
    //Example 7: Find the account name, account rating,
	//contact name, contact department, contact title,
	//and case number, case subject for every contact.... 

    //in APEX: query is typed in square bracket []...
    
    public void queryMethod(){
        //type the query to call records and put into a variable...
      List<Contact> myContacts = [SELECT Name, Department, Title,
                                  Account.Name, Account.Rating,
                                  (SELECT CaseNumber, Subject FROM Cases) FROM Contact];
        
        //print all the records in different lines on the console....
        for(Contact con : myContacts){
            System.debug(con);
        }
        //we will not see case details in printed records...
        //we will not see parent account details on the console
        //we can see the details from only main object (Contact)
        //1) No parent details... 2) No child details
        
        //How to see parent object details
        for(Contact c : myContacts){
            System.debug('Account Name: ' + c.Account.Name + ', Account Rating: ' +c.Account.Rating );
        }//you have to specify parent details to print....
        
     //How to see child object details... 
        for(Contact con : myContacts){
            
            for(Case cs : con.Cases){
                System.debug('Case Number: ' + cs.CaseNumber + ', Case Subject: ' + cs.Subject);
            }
            
        }
        
    }

}