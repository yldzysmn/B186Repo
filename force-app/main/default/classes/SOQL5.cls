public class SOQL5 {
    
    //Example 11: Fetch Industry with Energy and Transportation, average and total number of employees per industry

    public void queryAgg(){
        
      AggregateResult[] groupedResult = [SELECT Industry, SUM(NumberOfEmployees)sum, AVG(NumberOfEmployees)avg 
            FROM Account WHERE Industry IN('Energy','Transportation') GROUP BY Industry]; 
        
        for(AggregateResult ar : groupedResult){
            
            System.debug('Industry: '+ ar.get('Industry') + ' - Total Number Of Employees:  ' + ar.get('sum'));
            System.debug('Average Number of Employees: ' + ar.get('avg'));
            
        }
        
    }
}