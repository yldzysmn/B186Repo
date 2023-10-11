public class SOSL {
    
    //Example 4: If any account name contains 'un' in naming 
    //give me the account name, contact firstname&lastname and opportunity name
    
    public static void Sosl01(){
        //we will use list in the list: bcs many object return at the same time without hierarchy
        //when we have list in the list in SOSL, we use Object data type or sObject data type
        //bcs Account, Contact, Opportunity are salesforce objects...
       List<List<sObject>> myList = [FIND '*un*' IN NAME FIELDS RETURNING Account(Name), Contact(FirstName, LastName), Opportunity(Name)];
        
        
			System.debug(myList);
        for(List<sObject> w : myList){
            
            System.debug(w);//display each objects in different lines
            
            //display each records in different lines
            for (sObject obj : w){
                System.debug(obj);
            }
        }
     
    }
    
    public static void Sosl02(){
    //Example 5: If any Account, Contact or Opportunity has 
    //'United' and '88' in Name, email and phone fields..
    List<List<sObject>> myObj= [FIND '*United* OR  "88" ' IN ALL FIELDS RETURNING  Account(Name, Phone), Contact(Name, Phone),Opportunity(Name)];
    for(List<sObject> objects: myObj){
        
        for(sObject w:objects ){
            
            System.debug(w);
        }
    }
   }
  }