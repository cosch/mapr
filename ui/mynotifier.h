#ifndef MYNOTIFIER_H
#define MYNOTIFIER_H

#include <QObject>
#include "QXmppClient.h"

class MyNotifier : public QObject
{
    Q_OBJECT
public:
    explicit MyNotifier(QObject *parent = 0);
    
signals:
    void update();

public slots:
    void notifyStateChange(QXmppClient::State) {
        emit update();
    }
    
};

#endif // MYNOTIFIER_H
