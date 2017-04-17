trigger ExampleTry on Contact(after insert, before update, after update, before delete, after delete) {
//Creates variable accounts to hold ids
/*
if(Trigger.isAfter) {
if(Trigger.isInsert) {
    System.debug('Hello World!');
Set<Id> AccountIds = new Set<Id>();
//Moves through the newly created/update accounts one by one
for (Contact con : Trigger.new) {
if(con.Active__c){
AccountIds.add(con.AccountId);
}
}
List<Account> AcctToUpdate = new List<Account>();
for (Account acc: [Select id, Name from Account where Id IN: AccountIds ]) {
acc.Active__c = true;
AcctToUpdate.add(acc);
}
if(AcctToUpdate.size() > 0){
update AcctToUpdate;
} 
}
}
    //For updating 
    if(Trigger.isUpdate){
       Set<Id> AccountIdsFortrue = new Set<Id>();
        
//Moves through the newly created/update accounts one by one
for (Contact con : Trigger.new) {
if(con.Active__c != trigger.oldmap.get(con.Id).Active__c){
        AccountIdsFortrue.add(con.AccountId);
    
}
}
                List<Account> AcctToUpdateForTrue = new List<Account>();
        
           
for (Account acc: [Select id, Name, (Select Active__c from contacts) from Account where Id IN: AccountIdsFortrue ]) {
acc.Active__c = false;
    for(Contact cc :[Select id,Active__c from Contact where AccountId =:acc.Id ] ){
        if(cc.Active__c==true){
       acc.Active__c = true;        
    }
    }
    
AcctToUpdateForTrue.add(acc);
}
if(AcctToUpdateForTrue.size() > 0){
update AcctToUpdateForTrue;
} 
}
    
    //For deleting 
    if(Trigger.isDelete){
       Set<Id> AccountIdsForDelete = new Set<Id>();
        
//Moves through the newly created/update accounts one by one
for (Contact con : Trigger.old) {
        AccountIdsForDelete.add(con.AccountId);
    
}
                List<Account> AcctToUpdateForDelete = new List<Account>();
        
           
for (Account acc: [Select id, Name, (Select Active__c from contacts) from Account where Id IN: AccountIdsForDelete ]) {
acc.Active__c = false;
    for(Contact cc :[Select id,Active__c from Contact where AccountId =:acc.Id ] ){
        if(cc.Active__c==true){
       acc.Active__c = true;        
    }
    }
    
AcctToUpdateForDelete.add(acc);
}
if(AcctToUpdateForDelete.size() > 0){
update AcctToUpdateForDelete;
} 
}*/
}