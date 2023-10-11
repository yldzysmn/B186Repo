public class RoomPostCall {
    public static void postRoom(){
        Room room= new Room();
        room.description='This room is created for review';
        room.price= 550;
        room.roomNumber= 56483646;
        room.status=true;
        room.roomType= 'DELUXE';
        String apexToJson =JSON.serialize(room);
        
        
        Http http= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://www.medunna.com/api/rooms');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ5aWxkaXpzZWNraW4iLCJhdXRoIjoiUk9MRV9BRE1JTiIsImV4cCI6MTY5NjE3Mzg4Nn0.MdLJ-OFVoUjDyUgdXlmXdgo-csGOH7hVGdudfawKbkJrFWFuhAqSoH-sl9bDXUyd8KphMvbIF6X4n_TucVEzew');
        request.setBody(apexToJson);
        HttpResponse response= Http.send(request);
        System.debug('Status code' + response.getStatusCode());
        System.debug('Status' + response.getStatus());
        System.Assert(response.getStatusCode()== 201, 'Status code does not match!');
    }
    public class Room {
        public String description;
        public Integer price;
        public Integer roomNumber;
        public Boolean status;
        public String roomType;
        
    }
}