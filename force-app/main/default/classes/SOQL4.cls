public class SOQL4 {
    
    
//Example 10: Fetch Industry and average number of employees per Industry
//print the results on the console in the same line and different lines...
    public void queryAggregate(){
        
        
       AggregateResult[] result = [SELECT Industry, AVG(NumberOfEmployees)avg FROM Account GROUP BY Industry];
        System.debug(result);
       Object avgValueOfBiotech = result[2].get('avg');
        System.debug('Avg Value of Biotechnology : ' + avgValueOfBiotech );
        
        
         //to print in different lines
    for(AggregateResult res : result){
        
        System.debug(res.get('Industry') + ' - ' + res.get('avg'));
        
    }
        
    }
      
}