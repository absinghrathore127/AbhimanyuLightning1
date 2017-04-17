public with sharing class AccountController {
    
    @AuraEnabled
    public static List<Account> getExpenses(String field , String filterLogic) {
        if(filterLogic != '' && filterLogic != null){
            Map<Integer,String> optionMap = new Map<Integer,String>();
            for(Account_Option__c opp:[Select name,sequence_number__c from account_Option__c] ){
                optionMap.put(Integer.valueOf(opp.sequence_number__c), opp.name) ;
            }
            
            String modifyfilterLogic = '';
            if(filterLogic.containsAny('5')){
                
                modifyfilterLogic =  filterLogic.replace('1', optionMap.get(1)).replace('2', optionMap.get(2))
                    .replace('3', optionMap.get(3)).replace('4', optionMap.get(4)).replace('5', optionMap.get(5));
                
            }else if(filterLogic.containsAny('4')){
                modifyfilterLogic =  filterLogic.replace('1', optionMap.get(1)).replace('2', optionMap.get(2))
                    .replace('3', optionMap.get(3)).replace('4', optionMap.get(4));
            }else if(filterLogic.containsAny('3')){
                modifyfilterLogic =  filterLogic.replace('1', optionMap.get(1)).replace('2', optionMap.get(2))
                    .replace('3', optionMap.get(3));
            }else if(filterLogic.containsAny('2')){
                modifyfilterLogic =  filterLogic.replace('1', optionMap.get(1)).replace('2', optionMap.get(2));
            }else if(filterLogic.containsAny('1')){
                modifyfilterLogic =  filterLogic.replace('1', optionMap.get(1));
            }
            System.debug('filterLogic'+filterLogic);
            String query = 'select name, phone , id from account where'+' '+modifyfilterLogic;
            System.debug('query string'+query);
            List<Account> getAccount =  Database.query(query);
            System.debug('getAccount'+getAccount);
            return getAccount;
        }else{
            String query = 'select name, phone , id from account where'+' '+field;
            System.debug('query string'+query);
            List<Account> getAccount =  Database.query(query);
            System.debug('getAccount'+getAccount);
            return getAccount;
        }
    }
    
    @AuraEnabled
    public static void saveOption(String field, String operator, String value) {
        // Perform isUpdatable() checking first, then
        Account_Option__c option = new Account_Option__c();
        value = '\''+value+'\'';
        String query = ' '+field+' '+operator+' '+value;
        option.Name = query;
        insert option;
    }
    
    @AuraEnabled
    public static void deleteOption() {
        // Perform isUpdatable() checking first, then
        List<Account_Option__c> option = [Select id from account_Option__c];
        delete option;
    }
    
    @AuraEnabled
    public static String getAccountFilters() {
        String query = 'select name from Account_Option__c order By CreatedDate ASC';
        Integer i = 1;
        
        List<Account_Option__c> getAccount =  Database.query(query);
        System.debug('result for getAccount'+getAccount);
        String result = '';
        for(Account_Option__c acc: getAccount){
            acc.sequence_Number__c = i;
            result = result+acc.Name+' '+'AND'+' ';
            System.debug('result showing'+result);
            i++;
        }
        update getAccount;
        String r1 = result.removeEnd(' ');
        String r2 = r1.removeEnd('AND');
        return r2;
    }
    
    @AuraEnabled
    public static String getAccountFromSavedFilter(String name) {
        String query = 'select name from Accounts_Filter__c where Savedfilters__r.Name =\''+name+'\'';
        System.debug('query'+query);
        List<Accounts_Filter__c> getAccount =  Database.query(query);
        System.debug('result for getAccount'+getAccount);
        String result = '';
        for(Accounts_Filter__c acc: getAccount){
            result = result+acc.Name+' '+'AND'+' ';
            System.debug('result showing'+result);
        }
        String r1 = result.removeEnd(' ');
        String r2 = r1.removeEnd('AND');
        return r2;
    }
    
    @AuraEnabled
    public static void getAccountupdatedlist( String name) {
        //String query = 'select name from Account_Option__c';
        Account_Filter_Name__c filterNames = new Account_Filter_Name__c();
        filterNames.Name = name;
        insert filterNames;
        
        List<Account_Option__c> listoption = [select name from Account_Option__c];
        
        List<Accounts_Filter__c> listfilters = new List<Accounts_Filter__c>();
        Integer i = 1;
        for(Account_Option__c ao : listoption){
            Accounts_Filter__c filters = new Accounts_Filter__c();
            filters.Name = ao.Name;
            filters.Savedfilters__c = filterNames.Id;
            filters.sequence_Number__c = i;
            listfilters.add(filters);
            i++;
        }
        insert listfilters;
    }
    @AuraEnabled
    public static List < String > getselectOptions(sObject objObject, string fld) {
        system.debug('objObject --->' + objObject);
        system.debug('fld --->' + fld);
        List < String > allOpts = new list < String > ();
        for(Account_Filter_Name__c filteredName : [select name from Account_Filter_Name__c]){
            allOpts.add(filteredName.Name);
        }
        return allOpts;
    }
}