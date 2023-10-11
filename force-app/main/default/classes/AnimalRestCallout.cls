public class AnimalRestCallout {
    //Example 2= Call the animal data from Heroku website and print on the console
    public static void getAnimals(){
        Http http= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
         HttpResponse response= http.send(request);
        
        If(response.getStatusCode() ==200){
            /*
             //Parse the data :convert from Json to Apex
            Map<String, Object> result=(Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals= (List<Object>) result.get('animals');
            for(Object w : animals){
                System.debug(w);
            }
                  */
            //Call parser helper class and use parse method..  
            RestAnimalParser restAnmlPars= RestAnimalParser.parse(response.getBody());
            for(Object w: restAnmlPars.animals){
                System.debug(w);
            }
        }
    }

}