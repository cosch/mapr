#include "xmppservice.h"

QXmppService::QXmppService(QObject *parent) :
    QObject(parent)
{    
    m_xmpp_client.addExtension(&m_muc_man);

    bool check;
    Q_UNUSED(check);

    check = QObject::connect( &m_xmpp_client, SIGNAL(stateChanged(QXmppClient::State)), this, SLOT(notifyStateChange(QXmppClient::State)) );
    Q_ASSERT(check);

    connect();
}

void QXmppService::connect()
{
    m_xmpp_client.configuration().setJid("footest@jabber.org");
    m_xmpp_client.configuration().setPassword("footest23");
    QXmppLogger::getLogger()->setLoggingType(QXmppLogger::StdoutLogging);
    m_xmpp_client.connectToServer(m_xmpp_client.configuration());
}
