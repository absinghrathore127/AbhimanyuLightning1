trigger MyTrigger on Contact (after insert) {
List<Account> acc= new List<Account>([SELECT Active__c from Account where Name='Abhimanyu']);
    
    
}