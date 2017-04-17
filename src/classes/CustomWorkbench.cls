public without sharing class CustomWorkbench {
 public List<sObject> recordlist { get; set; }
    public String query1 { get; set; }
    public List<String> fieldNameToString { get; set; }
    public List<SelectOption> fieldNames{get; set;}
    public String CorrespondingFields{ get; set; }
    public String AllObjectsList { get; set; }
    
    public class innerWrapperClass{
       public List<String> SelectedFieldsName { get; set; }
    }
        public Real_Cal__c relCal {get;set;}
    
    public CustomWorkbench(ApexPages.StandardController controller) {
        relCal = ( Real_Cal__c ) controller.getRecord();
    }
    public PageReference DisplayRecords() {
        if(CorrespondingFields != null){
            integer length = CorrespondingFields.length();
           // CorrespondingFields= CorrespondingFields.substring(1,length-1);
            String[] separate = CorrespondingFields.split(',\\s*');
            query1 = 'Select ' + CorrespondingFields + ' from ' + AllObjectsList;
            
            if( relCal.Id != null ) {
                relCal.Calendar_Object__c = AllObjectsList + '.' + CorrespondingFields;
                upsert relCal;
            }
           
            try{
                recordlist = Database.query(query1);
            }
            catch(Exception es){
                ApexPages.addMessages(es);
            }
            System.debug('recordlist ' + recordlist );
            System.debug('query1 '+query1 );
        }
//        return null;
        PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());

		pageRef.setRedirect(true);

		return pageRef;

        // Send the user back to current page. 
    }
    
    public void getAllFields() {
        System.debug('all AllObjectsList' + AllObjectsList);
        fieldNameToString = new List<String>();
        fieldNames = new List<SelectOption>();
        if(AllObjectsList != null){
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjectSchema = schemaMap.get(AllObjectsList);
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
            fieldNames.add(new SelectOption('','--------Select--------'));
                  
              List<SelectOption> optionsToSort = new List<SelectOption>();
                for(Schema.SObjectField fieldApi : fieldMap.values()) {  
               optionsToSort.add(new SelectOption( fieldApi.getDescribe().getName(), fieldApi.getDescribe().getLabel() ));
            }
           optionsToSort = SortingUtil.sortObjectsAndFields( optionsToSort );
           fieldNames.addAll(optionsToSort );
        }
        
       
    }
   
    
    public List<SelectOption> getAllObjects() {
        List<Schema.sObjectType> gd = Schema.getGlobalDescribe().Values();
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','--------Select--------'));
        List<SelectOption> optionsToSort = new List<SelectOption>();
        for(Schema.sObjectType gd1 : gd){
            
            optionsToSort.add(new SelectOption( gd1.getDescribe().getName(), gd1.getDescribe().getLabel() ));
        }
        
        optionsToSort = SortingUtil.sortObjectsAndFields( optionsToSort );
        options.addAll( optionsToSort );
        
        System.debug('option values' + options);
        
        return options;
        
    }
    
   
   
}