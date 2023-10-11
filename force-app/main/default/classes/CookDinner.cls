public class CookDinner {
    //create class constructor here and collect all method 
    //constructor in it
    //so in one single line we can execute all the methods
    
    public CookDinner(){
        makeSoup();
        makeSalad();
        makeMeat();
        makeDessert(); 
        fixTheCar();
    }

    public static void makeSoup(){
        System.debug('Soup is being prepared');
    }
    public static void makeSalad(){
        System.debug('Salad is being prepared');
    }
    public static void makeMeat(){
        System.debug('Meat is being prepared');
    }
    @future
    public static void makeDessert(){
        System.debug('Dessert is being prepared');
    }
    @future
    public static void fixTheCar(){
        System.debug('Car is being prepared in mechanic');
    }
    
}