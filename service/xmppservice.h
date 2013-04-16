#ifndef QXMPPSERVICE_H
#define QXMPPSERVICE_H

#include "QXmppClient.h"
#include "QXmppMucManager.h"
#include <QObject>

#include "listmodel.h"

class QXmppService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int state READ state)

public:
    explicit QXmppService(QObject *parent = 0);
    
    void connect();

    int state() const { return (int)m_xmpp_client.state();}
    QListModel&  room_model() {return *m_room_model; }

signals:
    void stateChanged();
    void roomsChanged();

public slots:
    void notifyStateChange(QXmppClient::State);

    void notifyRoomsChanged(QXmppMucRoom *room);

private:
    QXmppClient     m_xmpp_client;
    QXmppMucManager m_muc_man;
    QListModel*      m_room_model;
};

#endif // QXMPPSERVICE_H

