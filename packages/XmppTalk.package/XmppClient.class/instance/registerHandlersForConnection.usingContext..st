callbacks-registration
registerHandlersForConnection: connOpaqueObject usingContext: ctxOpaqueObject

	"Register handlers for incoming types. This is performed when connected because the handlers are specific to the connection. In the current implementation, all handlers are added"
	lib
		xmppAddHandler: (self callbackNamed: #versionHandler)
		forNs: XmppStanzaNS NS_VERSION 
		forName: XmppStanzaName NAME_IQ
		forType: nil
		withUserData: ctxOpaqueObject getHandle
		forConnection: connOpaqueObject.
		
	lib
		xmppAddHandler: (self callbackNamed: #discoInfoHandler)
		forNs: XmppStanzaNS NS_DISCOINFO 
		forName:  XmppStanzaName NAME_IQ
		forType: XmppStanzaType TYPE_GET 
		withUserData: ctxOpaqueObject getHandle
		forConnection: connOpaqueObject.
		
	lib
		xmppAddHandler: (self callbackNamed: #timeHandler)
		forNs: XmppStanzaNS NS_TIME
		forName: XmppStanzaName NAME_IQ
		forType: XmppStanzaType TYPE_GET
		withUserData: ctxOpaqueObject getHandle
		forConnection: connOpaqueObject.
		
	lib
		xmppAddHandler: (self callbackNamed: #pingHandler)
		forNs:XmppStanzaNS NS_PING
		forName: XmppStanzaName NAME_IQ
		forType: XmppStanzaType TYPE_GET
		withUserData: ctxOpaqueObject getHandle
		forConnection: connOpaqueObject.
	
	lib
		xmppAddHandler: (self callbackNamed: #presenceHandler)
		forNs: nil
		forName: XmppStanzaName NAME_PRESENCE
		forType: XmppStanzaType TYPE_SUBSCRIBE
		withUserData: ctxOpaqueObject getHandle
		forConnection: connOpaqueObject.

	lib
		xmppAddHandler: (self callbackNamed: #presenceChangeHandler)
		forNs: nil
		forName: XmppStanzaName NAME_PRESENCE
		forType: nil
		withUserData: ctxOpaqueObject getHandle
		forConnection: connOpaqueObject.


	lib
		xmppAddHandler: (self callbackNamed: #messageHandler)
		forNs: nil
		forName: XmppStanzaName NAME_MESSAGE
		forType: nil
		withUserData: ctxOpaqueObject getHandle
		forConnection: connOpaqueObject