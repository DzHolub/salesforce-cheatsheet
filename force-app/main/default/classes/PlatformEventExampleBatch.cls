public with sharing class PlatformEventExampleBatch implements Database.Batchable<SObject>, Database.RaisesPlatformEvents {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Name FROM Account LIMIT 100]);
    }

    public void execute(Database.BatchableContext bc, List<Account> accList) {
        for (Account acc : accList) {
            acc.Name = null; // prepare intended exception 
        }

        update accList;
    }

    public void finish(Database.BatchableContext bc) {}
}