#ifndef QXMPPSERVICE_H
#define QXMPPSERVICE_H

#include "QXmppClient.h"
#include "QXmppMucManager.h"
#include <QObject>

class QXmppService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int state READ state)

public:
    explicit QXmppService(QObject *parent = 0);
    
    void connect();

    int state() const { return (int)m_xmpp_client.state();}

signals:
    void stateChanged();

public slots:
    void notifyStateChange(QXmppClient::State) {
        emit stateChanged();
    }

private:
    QXmppClient     m_xmpp_client;
    QXmppMucManager m_muc_man;
};

#endif // QXMPPSERVICE_H
