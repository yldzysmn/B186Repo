public class SoqlNew {
    //Example 1-
    //Account obectlerinin minimum maximum ve ortalama isci sayilarini
    // veren kodu yaziniz
    public static void method01(){
    AggregateResult[] result = [SELECT MIN(NumberOfEmployees), MAX(NumberOfEmployees), AVG(NumberOfEmployees) FROM Account ];
         System.debug(result);
         System.debug('Minimum number of employees :' + result[0].get('expr0'));
         System.debug('Maximum number of employees :' + result[0].get('expr1'));
         System.debug('Ortalama number of employees :' + result[0].get('expr2'));
}
    //2.way
    public static void method02(){
    AggregateResult[] result = [SELECT MIN(NumberOfEmployees) min, MAX(NumberOfEmployees) max, AVG(NumberOfEmployees) avg FROM Account ];
         System.debug(result);
         System.debug('Minimum number of employees :' + result[0].get('min'));
         System.debug('Maximum number of employees :' + result[0].get('max'));
         System.debug('Ortalama number of employees :' + result[0].get('avg'));
}
    //Account objectlerinin ortalama isci sayilarini Industrylere gore veren method olusturunuz
    public static void method03(){
  AggregateResult[] result= [SELECT Industry,AVG(NumberOfEmployees) avgByIndustry FROM Account GROUP BY Industry];
        System.debug(result);
        for(AggregateResult w: result){
            If(w.get('Industry') != null){
            System.debug('industry :' + w.get('Industry') + '-->Average of employee :' + w.get('avgByIndustry'));
          }
        }
    }
}