I am the XmppClient.

eXtensible Messaging and Presence Protocol (XMPP) 

Interesting read: https://el-tramo.be/documents/beautiful-xmpp-testing/

After connection configuration and initialization, during which callbacks are registered, my event loop is started and callbacks are invoked based on the stanzas being received. Stanzas are sent back.
When the event loop is done, the connection is release.

Pay attention that the callbacks are registered and are kept in a structure that allows them to avoid being garbage collected (callbacks-management protocol).



I am using the StropheXmppDefs PoolDictionary

Provides MUC protocol (Multi User Chat)

TODO: Introduce ZnLogEvent support for XMPP

https://xmpp.org/extensions/

Multi User Chat
https://xmpp.org/extensions/xep-0045.html

Ping
https://xmpp.org/extensions/xep-0199.html

Service Discovery
https://xmpp.org/extensions/xep-0030.html

Entity Time
https://xmpp.org/extensions/xep-0202.html


 RFC 6120: Extensible Messaging and Presence Protocol (XMPP): Core <http://tools.ietf.org/html/rfc6120>.

TODO: history could be kept with an announcer