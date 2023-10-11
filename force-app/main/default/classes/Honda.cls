public abstract class Honda {
    public abstract void engine();
    public void ac(){
        System.debug('Ac is good');
    }
}
  /* i) to remove unused body from a method we create abstract methods
 * ii)to make some functionalities for child classes we create abstract methods
 * iii) When you create an abstract method you have to use abstract keyword
 * iv) it is impossible to use abstract keyword 
 *  v) a concrete class cannot have any abstract method but an abstract class can have both abstract and concrete methods
 *  vi) to make a class 'Parent Class' you have to use 'virtual' or 'abstract' keywords in parent class
 * What is the defference between virtual and abstract keyword?
 * -->if you use abstract class all abstract ethods must be overridden by all child classes
 * ---But in virtual class it is not must to override any methods
 * -->You cannot create any object from abstract classes but it is possible to create objects from virtual classes
 * +++ Apex doesnt support multiple inheritance , I mean a child class cannot have multiple parents.
 *  But sometimes we need multiple parents.
 * If you use classes you cannot create multiple parents for a child class
 * but when you use interface it is possible
 * +++ Interfaces cannot have any concrete methods
 * +++ You cannot create any object from interfaces
 * */