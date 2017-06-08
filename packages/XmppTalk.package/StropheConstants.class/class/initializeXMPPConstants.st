initialization
initializeXMPPConstants
	XMPP_EOK := 0.
	XMPP_EMEM := -1.
	XMPP_EINVOP := -2.
	XMPP_EINT := -3.
	
	self StringConstants
		at: #XMPP_NS_CLIENT put: 'jabber:client';
		at: #XMPP_NS_COMPONENT put: 'jabber:component:accept';
		at: #XMPP_NS_STREAMS put: 'http://etherx.jabber.org/streams';
		at: #XMPP_NS_STREAMS_IETF put: 'urn:ietf:params:xml:ns:xmpp-streams';
		at: #XMPP_NS_TLS put: 'urn:ietf:params:xml:ns:xmpp-tls';
		at: #XMPP_NS_SASL put: 'urn:ietf:params:xml:ns:xmpp-sasl';
		at: #XMPP_NS_BIND put: 'urn:ietf:params:xml:ns:xmpp-bind';
		at: #XMPP_NS_SESSION put: 'urn:ietf:params:xml:ns:xmpp-session';
		at: #XMPP_NS_AUTH put: 'jabber:iq:auth';
		at: #XMPP_NS_DISCO_INFO put: 'http://jabber.org/protocol/disco#info';
		at: #XMPP_NS_DISCO_ITEMS put: 'http://jabber.org/protocol/disco#items';
		at: #XMPP_NS_ROSTER put: 'jabber:iq:roster'