#include "xmppservice.h"
#include "roomitem.h"

QXmppService::QXmppService(QObject *parent) :
    QObject(parent),
    m_room_model( new QListModel(new QRoomItem, this) )
{    
    m_xmpp_client.addExtension(&m_muc_man);

    bool check;
    Q_UNUSED(check);

    check = QObject::connect( &m_xmpp_client, SIGNAL(stateChanged(QXmppClient::State)), this, SLOT(notifyStateChange(QXmppClient::State)) );
    Q_ASSERT(check);

    check = QObject::connect( &m_muc_man, SIGNAL(roomAdded(QXmppMucRoom*)), this, SLOT(notifyRoomsChanged(QXmppMucRoom *)) );
    Q_ASSERT(check);

    connect();

    //m_room_model->appendRow(new QRoomItem("tja", NULL, m_room_model));
}

QXmppService::~QXmppService()
{
    m_xmpp_client.disconnectFromServer();
}

void QXmppService::connect()
{
    m_xmpp_client.configuration().setJid("footest@jabber.org");
    m_xmpp_client.configuration().setPassword("footest23");
    QXmppLogger::getLogger()->setLoggingType(QXmppLogger::StdoutLogging);
    m_xmpp_client.connectToServer(m_xmpp_client.configuration());
}

void QXmppService::notifyStateChange(QXmppClient::State s)
{
    if( s==2 )
    {
        qDebug() << "creating Room";
        QXmppMucRoom *room = m_muc_man.addRoom("#mapr@conference.jabber.org");
        room->setNickName("maprfootester");
        room->setPassword("footest");
        qDebug() << "joining Room";
        room->join();
    }
    emit stateChanged();
}

void QXmppService::notifyRoomsChanged(QXmppMucRoom *room)
{
    m_room_model->appendRow(new QRoomItem(QString(room->jid()), room, m_room_model));
    emit roomsChanged();
}
