@isTest
private class TemperatureConvertorTest {
    
    @isTest
    static void testWarmTemp(){
        
         Decimal celcius = TemperatureConvertor.FahrenheitToCelcius(70); //21.11
        Assert.areEqual(21.11, celcius, 'Check your method again!');
    }
    
       @isTest
    static void testFreezingPoint(){
        
         Decimal celcius = TemperatureConvertor.FahrenheitToCelcius(32); //21.11
        Assert.areEqual(0, celcius, 'Check your expectation or method again!');
    }
    
         @isTest
    static void testBoilingPoint(){
        
         Decimal celcius = TemperatureConvertor.FahrenheitToCelcius(212); //21.11
        Assert.areEqual(100, celcius, 'Check your expectation or method again!');
    }
    
            @isTest
    static void testNegativeTemp(){
        
         Decimal celcius = TemperatureConvertor.FahrenheitToCelcius(-10); //21.11
        Assert.areEqual(-23.33, celcius, 'Check your expectation or method again!');
    }
}