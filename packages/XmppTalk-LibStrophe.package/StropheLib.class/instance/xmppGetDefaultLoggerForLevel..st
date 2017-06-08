xmpp-logger
xmppGetDefaultLoggerForLevel: level

"/* return a default logger filtering at a given level */"
	^self ffiCall: #(xmpp_log_t *xmpp_get_default_logger(xmpp_log_level_t level))
	"^self ffiCall: #(xmpp_log_t *xmpp_get_default_logger(int level))"