public class ContactTriggerHandler{
    Set<Id> setAccountIds = new Set<Id>();
    public void onAfterInsert(List<Contact> listContacts){
        for(Contact newContact: listContacts){
            //check if contct is related to Account or not
            if(newContact.AccountId!=null){ 
                setAccountIds.add(newContact.AccountId);
            }
        }
        if(!setAccountIds.isEmpty()){
            ContactTriggerHelper.countContactsOnAccount(setAccountIds);
        }
    }
    
    public void onAfterUpdate(List<Contact> listContacts, Map<Id,Contact> mapOldContacts){
        for(Contact newContact: listContacts){
            Contact oldContact = mapOldContacts.get(newContact.Id);
            //check contact account is changed or not and Contact is realted to Account.
            if(newContact.AccountId !=null ){
                if(newContact.AccountId!=oldContact.AccountId){
                    //Add both Account Ids for updation.
                    setAccountIds.add(newContact.AccountId);
                    setAccountIds.add(oldContact.AccountId);
                }
            }else if(newContact.AccountId == null && oldContact.AccountId!=null){
                setAccountIds.add(oldContact.AccountId);
            }
        }
        if(!setAccountIds.isEmpty()){
             ContactTriggerHelper.countContactsOnAccount(setAccountIds);
        }
    }
    
    public void onAfterDelete(List<Contact> listContacts){
        for(Contact oldContact: listContacts){
            if(oldContact.AccountId!=null){
                setAccountIds.add(oldContact.AccountId);
            }
        }
        if(!setAccountIds.isEmpty()){
             ContactTriggerHelper.countContactsOnAccount(setAccountIds);
        }
    }
    
    public void onAfterUndelete(List<Contact> listContacts){
        for(Contact newContact: listContacts){
            if(newContact.AccountId!=null){ 
                setAccountIds.add(newContact.AccountId);
            }
        }
        if(!setAccountIds.isEmpty()){
            ContactTriggerHelper.countContactsOnAccount(setAccountIds);
        }
    }
    
    
}