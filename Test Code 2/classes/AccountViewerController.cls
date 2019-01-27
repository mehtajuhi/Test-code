public class AccountViewerController {
	@AuraEnabled
    public static List<Account> getAccounts(){
        return [select id,name from account order by createddate desc limit 10];
    }
}