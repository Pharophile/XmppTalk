callbacks
versionHandlerCallback: lib
"
int version_handler(xmpp_conn_t * const conn, xmpp_stanza_t * const stanza, void * const userdata)
{
	xmpp_stanza_t *reply, *query, *name, *version, *text;
	char *ns;
	xmpp_ctx_t *ctx = (xmpp_ctx_t*)userdata;
	printf(""Received version request from %s\n"", xmpp_stanza_get_attribute(stanza, ""from""));
	
	reply = xmpp_stanza_new(ctx);
	xmpp_stanza_set_name(reply, ""iq"");
	xmpp_stanza_set_type(reply, ""result"");
	xmpp_stanza_set_id(reply, xmpp_stanza_get_id(stanza));
	xmpp_stanza_set_attribute(reply, ""to"", xmpp_stanza_get_attribute(stanza, ""from""));
	
	query = xmpp_stanza_new(ctx);
	xmpp_stanza_set_name(query, ""query"");
    ns = xmpp_stanza_get_ns(xmpp_stanza_get_children(stanza));
    if (ns) {
        xmpp_stanza_set_ns(query, ns);
    }

	name = xmpp_stanza_new(ctx);
	xmpp_stanza_set_name(name, ""name"");
	xmpp_stanza_add_child(query, name);
	
	text = xmpp_stanza_new(ctx);
	xmpp_stanza_set_text(text, ""libstrophe example bot"");
	xmpp_stanza_add_child(name, text);
	
	version = xmpp_stanza_new(ctx);
	xmpp_stanza_set_name(version, ""version"");
	xmpp_stanza_add_child(query, version);
	
	text = xmpp_stanza_new(ctx);
	xmpp_stanza_set_text(text, ""1.0"");
	xmpp_stanza_add_child(version, text);
	
	xmpp_stanza_add_child(reply, query);

	xmpp_send(conn, reply);
	xmpp_stanza_release(reply);
	return 1;
}
"
^ FFICallback
		signature: #(int #(void * conn , void * stanza, void * userdata))
		block: [ :conn :stanza :userdata | 
			| ctxOpaqueObject connOpaqueObject stanzaOpaqueObject   from replyStanzaOpaqueObject   queryStanzaOpaqueObject textStanzaOpaqueObject incomingStanzaId ns children nameStanzaOpaqueObject  versionStanzaOpaqueObject |
			
			ctxOpaqueObject := StropheXmppCtx fromHandle: userdata.	"Weird, but that's it."
			connOpaqueObject := StropheXmppConn fromHandle: conn.
			stanzaOpaqueObject := StropheXmppConn fromHandle: stanza.
			
			
			[ :exit |
			self
				termOut:
					('{now} -- versionHandlerCallback'
						format:
							{	(#now -> DateAndTime now)} asDictionary).

		from := lib xmppStanza: stanzaOpaqueObject  getAttribute: 'from'.			

		self
				termOut:
					('{now} -- versionHandlerCallback - incoming message from: {from}'
						format:
							{	(#now -> DateAndTime now). #from -> from} asDictionary).

		self halt.

		replyStanzaOpaqueObject  := lib xmppStanzaNewForContext: ctxOpaqueObject.

		lib xmppStanza: replyStanzaOpaqueObject setName: 'iq'.
		lib xmppStanza: replyStanzaOpaqueObject setTypeTo: 'result'.

		incomingStanzaId := lib xmppStanzaGetId: stanzaOpaqueObject.
		lib xmppStanza: replyStanzaOpaqueObject  setIdTo: incomingStanzaId.
		
		lib xmppStanza: replyStanzaOpaqueObject setAttribute: 'to' toValue: from.

		queryStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: queryStanzaOpaqueObject setName: 'query'.
	
		children	:= lib xmppStanzaGetChildren: stanzaOpaqueObject.
		ns := lib xmppStanzaGetNs: children.
		ns = 0 ifFalse: [ 
			"? what if we get null?"
			lib xmppStanza: queryStanzaOpaqueObject setNsTo: ns.
			 ].
		
		nameStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: nameStanzaOpaqueObject setName: 'name'.
		lib xmppStanza: queryStanzaOpaqueObject  addChild: nameStanzaOpaqueObject.
		
		textStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: textStanzaOpaqueObject setName: self defaultConnectionSpec nick.
		lib xmppStanza: nameStanzaOpaqueObject  addChild: textStanzaOpaqueObject.

		versionStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: versionStanzaOpaqueObject setName: 'version'.
		lib xmppStanza: queryStanzaOpaqueObject  addChild: versionStanzaOpaqueObject.
		
		textStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: textStanzaOpaqueObject setName: '1.0'.
		lib xmppStanza: versionStanzaOpaqueObject  addChild: textStanzaOpaqueObject.

		lib xmppStanza: replyStanzaOpaqueObject addChild: queryStanzaOpaqueObject.		
				
		
		self
				termOut:
					('{now} -- versionHandlerCallback - sending stanza out'
						format:
							{	(#now -> DateAndTime now)} asDictionary).
								
		lib xmppSendStanza: replyStanzaOpaqueObject onConnection:  connOpaqueObject.

		lib xmppStanzaRelease: replyStanzaOpaqueObject.
	

		self
				termOut:
					('{now} -- versionHandlerCallback - done'
						format:
							{	(#now -> DateAndTime now)} asDictionary).
		
		exit withValue: 1
		]
        ]