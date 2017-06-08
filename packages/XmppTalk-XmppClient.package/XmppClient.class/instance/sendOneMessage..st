event-loop-sending
sendOneMessage: aMessage 

	| to message replyStanzaOpaqueObject bodyStanzaOpaqueObject textStanzaOpaqueObject |

	to := aMessage at: #tojid.
	message := aMessage at: #payload.

	replyStanzaOpaqueObject  := lib xmppStanzaNewForContext: ctx.
	lib xmppStanza: replyStanzaOpaqueObject setNsTo: XmppStanzaNS NS_JABBER_CLIENT.
	lib xmppStanza: replyStanzaOpaqueObject setName: XmppStanzaName NAME_MESSAGE.
	lib xmppStanza: replyStanzaOpaqueObject setTypeTo: XmppStanzaType TYPE_CHAT.
	lib xmppStanza: replyStanzaOpaqueObject setAttribute: XmppStanzaAttr ATTR_TO toValue: to.
	"lib xmppStanza: replyStanzaOpaqueObject setId:  "
	
	bodyStanzaOpaqueObject := lib xmppStanzaNewForContext: ctx.
	lib xmppStanza: bodyStanzaOpaqueObject setName: XmppStanzaName NAME_BODY.
	textStanzaOpaqueObject := lib xmppStanzaNewForContext: ctx.
	lib xmppStanza: textStanzaOpaqueObject setText: message.
	lib xmppStanza: bodyStanzaOpaqueObject addChild: textStanzaOpaqueObject.
	lib xmppStanza: replyStanzaOpaqueObject addChild: bodyStanzaOpaqueObject.
	self sendStanza: replyStanzaOpaqueObject  onConnection: conn.
	lib xmppStanzaRelease: replyStanzaOpaqueObject.
	