import { LightningElement, wire, track } from 'lwc';
import { loadScript } from "lightning/platformResourceLoader";
import cometd from '@salesforce/resourceUrl/cometd';
import getSessionId from '@salesforce/apex/PlatformEventPublisher.getSessionId';

export default class MainPlatformEventChecker extends LightningElement {
    sessionId;
    error;

    @wire(getSessionId)
    wiredSessionId({ error, data }) {
        
        if (data) {
            this.sessionId = data;
            this.error = undefined;
            loadScript( this, cometd ).then(() => {
                let cometDLib = new window.org.cometd.CometD();
                cometDLib.configure( 
                    {
                        url: '/cometd/54.0/',
                        logLevel: 'debug',
                        url: window.location.protocol + '//' + window.location.hostname + '/cometd/58.0/',
                        requestHeaders: {Authorization: 'OAuth ' + this.sessionId},
                        appendMessageTypeToURL : false,
                    } 
                );
                cometDLib.websocketEnabled = false;
                cometDLib.handshake( function(status) {        
                    if (status.successful) {
                        cometDLib.subscribe('/event/Platform_Event_Main__e', 
                            function(message) {
                                console.log(JSON.stringify(message));
                            }
                        );
                    }
                });
            });
        } else if (error) {
            this.sessionId = undefined;
        }
    }
}