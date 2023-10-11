public class ChainedQueueableContact implements  Queueable{
    public void execute (QueueableContext context){
        List<Contact> conList = new List<Contact>();
        
        for(Integer i=1 ; i<21; i++){
            Contact con = new Contact();
            con.LastName='Chained Queueable';
            con.FirstName= 'Session ' + i ;
            conList.add(con);
          }
        insert conList;
        System.debug('Number of Inserted contacts : ' + conList.size());
        for(Contact c: conList){
            System.debug('Inserted Contact' + c);
        }
            
        }
    }