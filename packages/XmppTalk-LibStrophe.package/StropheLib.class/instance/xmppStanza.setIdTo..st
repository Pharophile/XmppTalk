xmpp-stanza-common-helpers
xmppStanza: stanza setIdTo: id

	^self ffiCall: #(int xmpp_stanza_set_id(xmpp_stanza_t * stanza, String id))
"int xmpp_stanza_set_type(xmpp_stanza_t * const stanza, const char * const type);
int xmpp_stanza_set_to(xmpp_stanza_t * const stanza, const char * const to);
int xmpp_stanza_set_from(xmpp_stanza_t * const stanza, const char * const from);"