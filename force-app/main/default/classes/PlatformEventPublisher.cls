public without sharing class PlatformEventPublisher {
    public static void publishMainEvent(String message, Boolean isTest) {
        Platform_Event_Main__e eventObj = new Platform_Event_Main__e();
        eventObj.Is_Test__c = isTest;
        eventObj.Status_Message__c = message;
        
        EventBus.publish(eventObj);
    }

    @AuraEnabled(cacheable=true)
    public static String getSessionId() {
        return UserInfo.getSessionId();
    }
}