@isTest
public class CustomWorkBenchTest {
    
@isTest static void getObjectsTest(){
  
     PageReference pgRef = Page.Assignment;
     Test.setCurrentPageReference (pgRef);
    
    Real_Cal__c acc = new Real_Cal__c(Calendar_Object__c = 'TestObjectName'+'.'+'TestObjectField');
    //Insert the object virtually
    insert acc;
 
    //Create a new instance of standard controller
    ApexPages.StandardController sc = new ApexPages.standardController(acc);

    CustomWorkbench controller = new CustomWorkbench(sc);
    CustomWorkbench.innerWrapperClass wrapper = new CustomWorkbench.innerWrapperClass();
    String name = 'Name';
    List<String> selectFieldsNamesTest = new List<String>();
    selectFieldsNamesTest.add(name);
    wrapper.SelectedFieldsName = selectFieldsNamesTest;
    controller.query1 = 'Select Calendar_Object__c from Real_Cal__c';
    System.assertEquals(controller.query1, 'Select Calendar_Object__c from Real_Cal__c');
    
     controller.CorrespondingFields = 'test';
     controller.AllObjectsList = 'account';
//    System.assertEquals(controller.CorrespondingFields, 'Select Calendar_Object__c from Real_Cal__c');
    
    controller.getAllObjects();
    controller.getAllFields();
    controller.DisplayRecords();
    }
}