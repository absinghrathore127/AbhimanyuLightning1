@isTest
public class TestVerifyDate {
     @isTest static void DateWithin30Days(){

         VerifyDate.CheckDates(System.today(),System.today().addDays(10));
  		 VerifyDate.CheckDates(System.today(),System.today().addDays(78)); 
    }
}