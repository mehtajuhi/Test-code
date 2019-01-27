public class ContactTriggerHelper{
    public static void countContactsOnAccount(Set<Id> setAccountIds){ 
    
        List<Account> listUpdateAccounts = [select id,Number_of_Contacts__c , (select id from contacts ) from account where id in :setAccountIds];
        for(Account acc : listUpdateAccounts) {
            List<Contact> lstContacts = acc.contacts;          
            acc.Number_of_Contacts__c = lstContacts.size();
        }
        if(!listUpdateAccounts.isEmpty()){
            update listUpdateAccounts;
        }
    }
}