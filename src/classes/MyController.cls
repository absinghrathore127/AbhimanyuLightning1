public class MyController {

    private final Application_Form__c account;

    public MyController() {
        account = [SELECT Id, Name FROM Application_Form__c
                   WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }

    public Application_Form__c getAccount() {
        return account;
    }

    public PageReference save() {
        update account;
        return null;
    }

}