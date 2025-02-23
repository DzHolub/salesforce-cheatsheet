# Salesfroce Platform Event Usage Examples

Content:
1. Platform Event implementation via CometD (Digital Experiences Site).
2. BatchApexErrorEvent implementation (catch batch apex errors via standard platform event object) 

# SETUP GUIDE
Platform Event implementation via CometD:
1. Deploy static rosource cometd.js or upload it manually (Open Salesforce instance -> Setup -> Static Resources -> Create New Resource -> Upload and save extracted js file (Cache Control: public))
2. Review, update and deploy the other logic from repo
3. Add LWC to digital experiences site
4. Important: in order to work a user must be logged in the customer portal
5. Give access to the portal user profile: 
    * to related apex classes
    * to read platform events

BatchApexErrorEvent implementation:
1. Review and deploy: Exception_Log__c custom object, BatBatchErrorEventHandler.cls, BatchErrorEventTrigger.cls, PlatformEventExampleBatch.cls
2. Execute the following command in the Dev Console (ensure that accounts are existing in the instance): 
    Database.executeBatch(new PlatformEventExampleBatch());
3. Review created Exception_Log__c records.
For more information: https://developer.salesforce.com/docs/atlas.en-us.platform_events.meta/platform_events/sforce_api_objects_batchapexerrorevent.htm