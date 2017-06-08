initialization
initializeTypeMap

	TypeMap := Dictionary newFromPairs: #(
	xmpp_mem_t  StropheXmppMem
	xmpp_conn_t StropheXmppConn
	xmpp_ctx_t StropheXmppCtx
	xmpp_log_t StropheXmppLog
	xmpp_log_level_t StropheXmppLogLevel
	xmpp_sha1_t  StropheXmppSha1
	xmpp_stanza_t StropheXmppStanza
	xmpp_stream_error_t StropheXmppStreamError
	xmpp_timed_handler StropheXmppTimedHandler
	xmpp_handler StropheXmppHandler
	)