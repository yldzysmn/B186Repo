@IsTest
public with sharing class OpportunityManagerTest {

    @TestSetup
    static void makeData(){

        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=1; i<4; i++){

            Opportunity opp = new Opportunity();

            opp.Name = 'AppleStock' + i ;
            opp.CloseDate = Date.newInstance(2023,10,06);
            opp.StageName = 'Prospecting';

            oppList.add(opp);

        }
        insert opplist;
        System.assertEquals(3, oppList.size());

        for(Opportunity opp : oppList){
            System.assertEquals('Prospecting', opp.StageName);
        }
        }


    // in testing, when we execute actual method for test, it should return setup data
    //if so, assertion will be successful
   @IsTest 
   static void testOppStage() {

    test.startTest();
    List <Opportunity> opps = OpportunityManager.OppMan('Prospecting'); //I wonder if it will give me fake data from database properly
    test.stopTest();

    for(Opportunity opp: opps){

    
    System.assertEquals('Prospecting',opp.StageName);
    System.assertEquals(Date.newInstance(2023,10,06),opp.CloseDate);

    }
    System.assertEquals(3,opps.size());


        }

    }