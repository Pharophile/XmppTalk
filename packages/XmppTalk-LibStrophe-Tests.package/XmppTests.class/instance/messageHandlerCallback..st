callbacks
messageHandlerCallback: lib

"
int message_handler(xmpp_conn_t * const conn, xmpp_stanza_t * const stanza, void * const userdata)
{
	xmpp_stanza_t *reply, *body, *text;
	char *intext, *replytext;
	xmpp_ctx_t *ctx = (xmpp_ctx_t*)userdata;
	
	if(!xmpp_stanza_get_child_by_name(stanza, ""body"")) return 1;
	if(!strcmp(xmpp_stanza_get_attribute(stanza, ""type""), ""error"")) return 1;
	
	intext = xmpp_stanza_get_text(xmpp_stanza_get_child_by_name(stanza, ""body""));
	
	printf(""Incoming message from %s: %s\n"", xmpp_stanza_get_attribute(stanza, ""from""), intext);
	
	reply = xmpp_stanza_new(ctx);
	xmpp_stanza_set_name(reply, ""message"");
	xmpp_stanza_set_type(reply, xmpp_stanza_get_type(stanza)?xmpp_stanza_get_type(stanza):""chat"");
	xmpp_stanza_set_attribute(reply, ""to"", xmpp_stanza_get_attribute(stanza, ""from""));
	
	body = xmpp_stanza_new(ctx);
	xmpp_stanza_set_name(body, ""body"");
	
	replytext = malloc(strlen("" to you too!"") + strlen(intext) + 1);
	strcpy(replytext, intext);
	strcat(replytext, "" to you too!"");
	
	text = xmpp_stanza_new(ctx);
	xmpp_stanza_set_text(text, replytext);
	xmpp_stanza_add_child(body, text);
	xmpp_stanza_add_child(reply, body);
	
	xmpp_send(conn, reply);
	xmpp_stanza_release(reply);
	free(replytext);
	return 1;
}
"

		"int message_handler(xmpp_conn_t * const conn, xmpp_stanza_t * const stanza, void * const userdata)"

	^ FFICallback
		signature: #(int #(void * conn , void * stanza, void * userdata))
		block: [ :conn :stanza :userdata | 
			| ctxOpaqueObject connOpaqueObject stanzaOpaqueObject   intext replytext  errorStanza bodyChild from replyStanzaOpaqueObject incomingStanzaType actualReplyStanzaType bodyStanzaOpaqueObject textStanzaOpaqueObject |
			
			[ :exit |
			
			ctxOpaqueObject := StropheXmppCtx fromHandle: userdata.	"Weird, but that's it."
			connOpaqueObject := StropheXmppConn fromHandle: conn.
			stanzaOpaqueObject := StropheXmppConn fromHandle: stanza.
			
		self termOut: ('{now} -- messageHandlerCallback' format: {	(#now -> DateAndTime now)} asDictionary).

		((bodyChild	:= lib xmppStanzaGetChild: stanzaOpaqueObject byName: 'body') = 0) ifTrue: [ exit value: 1 ].
		
		((errorStanza	:= lib xmppStanza: stanzaOpaqueObject getAttribute: 'type') = 'error') ifTrue: [ exit value: 1 ].

		intext := lib xmppStanzaGetText: bodyChild.
		from := lib xmppStanza: stanzaOpaqueObject  getAttribute: 'from'.			

		self termOut: ('{now} -- messageHandlerCallback - incoming message from: {from}: {message}'	format: {	(#now -> DateAndTime now). #from -> from. #message -> intext} asDictionary).

		replyStanzaOpaqueObject  := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: replyStanzaOpaqueObject setName: 'message'.
		
		incomingStanzaType := lib xmppStanzaGetType: stanzaOpaqueObject.
		actualReplyStanzaType := incomingStanzaType = 0 ifTrue: [ 'chat' ] ifFalse: [ incomingStanzaType ].
		lib xmppStanza: replyStanzaOpaqueObject setTypeTo: actualReplyStanzaType.
		lib xmppStanza: replyStanzaOpaqueObject setAttribute: 'to' toValue: from.
		
		bodyStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: bodyStanzaOpaqueObject setName: 'body'.
		
		replytext := intext, ' to you too!'.
		
		textStanzaOpaqueObject := lib xmppStanzaNewForContext: ctxOpaqueObject.
		lib xmppStanza: textStanzaOpaqueObject setText: replytext.
		lib xmppStanza: bodyStanzaOpaqueObject addChild: textStanzaOpaqueObject.
		lib xmppStanza: replyStanzaOpaqueObject addChild: bodyStanzaOpaqueObject.
		
		self termOut: ('{now} -- messageHandlerCallback - sending' format: 	{	(#now -> DateAndTime now)} asDictionary).
				
		lib xmppSendStanza: replyStanzaOpaqueObject  onConnection: connOpaqueObject.
		lib xmppStanzaRelease: replyStanzaOpaqueObject.
		
		self termOut: ('{now} -- messageHandlerCallback - done' format: 	{	(#now -> DateAndTime now)} asDictionary).
		
		exit value: 1] valueWithExit2
	
        ]