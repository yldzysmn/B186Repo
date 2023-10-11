public class SOQL9 {
//Example: Fetch the record from database whose rating is hot and
// phone number is ""  
    public void deleteTheRecord(){
        /*my solutions
      List<Account> accs=[SELECT Name, Phone, Rating FROM Account WHERE Rating='Hot' AND Phone='+170999666333'];
        for(Account w: accs){
            System.debug(w);
        }
        delete accs;*/
        //another way
        
       /* List<Account> accList = [SELECT Name, Phone, Rating FROM Account WHERE Rating='Hot' AND Phone='+170999666333'];

			delete accList;
			Database.delete(acc);
       		Database.delete(acc, true);
			Database.delete(acc, false);
			System.debug(accList);   */
        
        //best practice is deleting records one by one...
       
        Account acc = [SELECT ID FROM Account WHERE Rating='Hot' AND Phone='+170999666333' LIMIT 1];
        delete acc;
        System.debug(acc);
        } 
    public void undeleteTheRecord(){
        //when a record is deleted; is deleted field will be 'True'
       List <Account> accsDelete= [SELECT Id, Name FROM Account WHERE Name='DenemeDelete' AND isDeleted= true ALL ROWS ];
        undelete accsDelete;
        //Database.undelete(accDelete, true);
	    //Database.undelete(accDelete, false);
        System.debug(accsDelete);
    }
  }