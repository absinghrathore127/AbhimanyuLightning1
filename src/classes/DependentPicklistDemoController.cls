public class DependentPicklistDemoController {
	
    @AuraEnabled
    public static List<Contact> getContacts() {
        return [
            SELECT Id, Name, AccountId, Account.Name
            FROM Contact
            LIMIT 200
        ];
    }
}