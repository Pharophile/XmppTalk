typedef struct {
    xmpp_error_type_t type;
    char *text;
    xmpp_stanza_t *stanza;
} xmpp_stream_error_t;