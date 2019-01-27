trigger ContactTrigger on Contact (After delete, After insert, After undelete,After update) {
    ContactTriggerHandler oContactTriggerHandler = new ContactTriggerHandler();
    
    if (Trigger.isInsert && Trigger.isAfter) {
        oContactTriggerHandler.onAfterInsert(Trigger.new);
    }
    
    if (Trigger.isUpdate && Trigger.isAfter) {
        oContactTriggerHandler.onAfterUpdate(Trigger.new, Trigger.oldMap);
    }
    
    if (Trigger.isDelete && Trigger.isAfter) {
        oContactTriggerHandler.onAfterDelete(Trigger.old);
    }
    
    if (Trigger.isUndelete && Trigger.isAfter) {
        oContactTriggerHandler.onAfterUndelete(Trigger.new);
    }
}