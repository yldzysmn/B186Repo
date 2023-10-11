public class RestAnimalParser {
       public List<String> animals;
    public static RestAnimalParser parse(String json){
        return (RestAnimalParser) System.JSON.deserialize(json, RestAnimalParser.class);
        
    }
}