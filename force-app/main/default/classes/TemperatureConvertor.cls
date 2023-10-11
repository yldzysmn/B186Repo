public class TemperatureConvertor {
 //Example 2: Create a temperature convertor class, convert input of fahrenheit to celcius
// it will cover boiling temperature, freezing point temperature, boiling point temperature and negative temperature

    public static Decimal FahrenheitToCelcius(Decimal fh){
        
        Decimal cs = (fh - 32) * 5/9;
        
        return cs.setScale(2); 
    }

}