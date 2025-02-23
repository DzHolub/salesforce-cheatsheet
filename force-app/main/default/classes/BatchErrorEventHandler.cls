public with sharing class BatchErrorEventHandler {

    public static void onAfterInsert(List<BatchApexErrorEvent> errorEventsList) {
        Set<Id> asyncApexJobIdSet = new Set<Id>();
        for (BatchApexErrorEvent errorEvent : errorEventsList) {
            asyncApexJobIdSet.add(errorEvent.AsyncApexJobId);
        }

        Exception_Log__c log = new Exception_Log__c();
        log.Error_Message__c = 'BatchErrorEventHandler. Failed job IDs: ' + asyncApexJobIdSet;
        insert log;
    }
}