public class MedunnaRoomCallout {
    @future
    public static void getRoom(Integer roomResultSize){
        Http http= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms?size=' + roomResultSize);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ5aWxkaXpzZWNraW4iLCJhdXRoIjoiUk9MRV9BRE1JTiIsImV4cCI6MTY5NjE3Mzg4Nn0.MdLJ-OFVoUjDyUgdXlmXdgo-csGOH7hVGdudfawKbkJrFWFuhAqSoH-sl9bDXUyd8KphMvbIF6X4n_TucVEzew');
        HttpResponse response= http.send(request);
            System.debug('Status code:' + response.getStatusCode());
            System.debug('Data' + response.getBody());
        List<Account> accountToInsert = new List<Account>(); //Accountlar icin bir Liste olustur
        If(response.getStatusCode()==200){
            List<Object> rooms= (List<Object>)JSON.deserializeUntyped(response.getBody());//from Json to apex: deserialize
            for(Object obj: rooms){
           Map<String,Object> roomMap= (Map<String, Object>) obj;//Object i Map e cevir
                String description= (String) roomMap.get('description'); //Description i al
                Account acc=  new Account();
                acc.Name = description; // Account name i belirle
                accountToInsert.add(acc); //Account u listeye ekle
                
                          }
            If(!accountToInsert.isEmpty()){
                insert accountToInsert; //Liste bos degilse tum Account lari ekle
            }
        }
    }

}