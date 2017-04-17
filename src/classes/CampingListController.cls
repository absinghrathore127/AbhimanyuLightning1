public with sharing class CampingListController {
    
    @AuraEnabled
    public static List<Camping_Item__c> getItems() {
        // Perform isAccessible() checking first, then
        return [SELECT Id, Name, Price__c, Quantity__c, Packed__c
                FROM Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c camping) {
        // Perform isUpdatable() checking first, then
        upsert camping;
        return camping;
    }
}