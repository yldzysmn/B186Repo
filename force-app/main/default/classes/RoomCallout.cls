public class RoomCallout {
    public static void getRoom(Integer roomResultSize ){
        Http http= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://www.medunna.com/api/rooms' + roomResultSize);
        request.setMethod('GET');
        request.setHeader('Authorization','Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ5aWxkaXpzZWNraW4iLCJhdXRoIjoiUk9MRV9BRE1JTiIsImV4cCI6MTY5NjE3Mzg4Nn0.MdLJ-OFVoUjDyUgdXlmXdgo-csGOH7hVGdudfawKbkJrFWFuhAqSoH-sl9bDXUyd8KphMvbIF6X4n_TucVEzew');
        HttpResponse response= Http.send(request);
        
            System.debug('Status code' + response.getStatusCode());
            System.debug('Data' + response.getBody());
        If(response.getStatusCode()== 200){
            List<Object> Rooms= (List<Object>)JSON.deserializeUntyped(response.getBody());
            for(Object w: Rooms){
                 System.debug(w);
            }
          
        }
        
        
        
    }

}