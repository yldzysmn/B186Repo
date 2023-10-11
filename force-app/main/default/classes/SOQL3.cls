public class SOQL3 {
//Example 9: Type query to see minimum and maximum number of employees, 
//and average number of employees for account object

    public static void queryAgg(){
        
        /*List<AggregateResult> rslt = [SELECT MIN(NumberOfEmployees), MAX(NumberOfEmployees), AVG(NumberOfEmployees) FROM Account];
        System.debug('LIST: ' + rslt); arrayis faster and use array*/
        
     AggregateResult[] result  = [SELECT MIN(NumberOfEmployees), MAX(NumberOfEmployees), AVG(NumberOfEmployees) FROM Account];
        System.debug(result);
        //(AggregateResult:{expr0=120, expr1=145000, expr2=20247.0})
        
       Object minValue = result[0].get('expr0');
        System.debug('Minimum Value : ' + minValue); //Minimum Value : 120
        
      Object maxValue = result[0].get('expr1');
        SYstem.debug('Maximum Value : ' + maxValue);
        
      Object avgValue = result[0].get('expr2');
        System.debug('Average Value : ' + avgValue);
   
       AggregateResult[] result1  = [SELECT MIN(NumberOfEmployees) min, MAX(NumberOfEmployees)max, AVG(NumberOfEmployees)avg FROM Account];
        System.debug(result1);
        //get the minumum value
       Object minValue1 = result1[0].get('min');
        System.debug('Minimum Value : ' + minValue1); //Minimum Value : 120
        // get the maximum value
      Object maxValue1 = result1[0].get('max');
        SYstem.debug('Maximum Value : ' + maxValue1);
        //get the average value
      Object avgValue1 = result1[0].get('avg');
        System.debug('Average Value : ' + avgValue1); 
        
    }
  }
/*
Any query that includes an aggregate function returns its results in an array of AggregateResult objects.
AggregateResult is a read-only sObject and is only used for query results.
*/