trigger BatchErrorEventTrigger on BatchApexErrorEvent (after insert) {
    BatchErrorEventHandler.onAfterInsert(Trigger.new);
}