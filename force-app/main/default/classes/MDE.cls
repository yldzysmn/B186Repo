public class MDE {
    public static void test(){
        //1.DML (Non setup obj)
       Account acc = new Account (Name= ' Deneme');
        insert acc;
        MDE.AssignPs();
      }   
       //2.DML (Setup obj)
    //Hangi permission set ve user oldugunu anlamak icin Id ile sorgulayalim
   @future
     public static void AssignPs(){
    PermissionSet ps=[SELECT Id FROM PermissionSet WHERE Name='Izin'];
     User u=[SELECT Id FROM User WHERE UserName='yldzysmn351@mindful-badger-dkoyyi.com'];
     PermissionSetAssignment psa= new PermissionSetAssignment(AssigneeId= u.Id , PermissionSetId=ps.Id);
        insert psa;
   

   }
}