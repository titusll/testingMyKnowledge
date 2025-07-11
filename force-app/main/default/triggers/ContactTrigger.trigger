trigger ContactTrigger on Contact (before insert) {

    if (Trigger.isInsert){
        for (Contact c : Trigger.new){
            if (c.Email == null){
                c.addError('cant create without email');
            }
            c.Status__c = 'New';
        }
    }
}