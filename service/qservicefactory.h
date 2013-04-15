#ifndef QSERVICEFACTORY_H
#define QSERVICEFACTORY_H

#include "singleton.h"
#include "qxmppservice.h"

#include <QObject>


class QServiceFactory : public QObject
{
friend class Singleton<QServiceFactory>;

    Q_OBJECT
public:
    static QServiceFactory* instance()
    {
        return &Singleton<QServiceFactory>::Instance();
    }

signals:
    
public slots:
    
private:
    explicit QServiceFactory(QObject *parent = 0);

private:
    QXmppService m_xmpp_service;
};

#endif // QSERVICEFACTORY_H
