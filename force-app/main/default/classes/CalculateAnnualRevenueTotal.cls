//USECASE 2. vol 2
// By using Account Ids, update account's annual revenue field with total amount of all the opportunities in an Account
// Account Id will be taken as an argument in method paramater
//use two method in class: 1) calculate total amounts. 2) update annual revenue in account
public class CalculateAnnualRevenueTotal {
    //calculate total amounts in opportunuties from one associated account
    
    private static Decimal calculateTotalAmountInOpps(Id accountId){
        
        //call opportunities from database assosciated with account whose id is coming from parameter
        List<Opportunity> oppList = [SELECT Amount FROM Opportunity WHERE AccountId=: accountId];
        
        
        //loop through the opportunities and calculate total amount
        Decimal totalAmount = 0;
        for(Opportunity opp: oppList){
            
         totalAmount = totalAmount + opp.Amount; // totalAmount += opp.Amount 
        }
        
        
        
        //return total amount
        return totalAmount;
    } 
    
    //update annual revenue field of account by assigning total amount calculated in the first method
    public static void updateAnnualRevenueWithAmounts(Id accountId){
        
        //retrieve the account record...
        Account acc = [SELECT Id, AnnualRevenue FROM Account WHERE ID=: accountId];
        
        //execute first method here and keep returning total amount in decimal container
       Decimal totalAmount = calculateTotalAmountInOpps(accountId);
        
        //assign the total amount returning from first method into the annual revenue field of account
            acc.AnnualRevenue =  totalAmount;       
        
        //update acc
        update acc;
        System.debug(acc);
        System.debug(acc.AnnualRevenue);
    }
    
    
}