#ifndef QSERVICEFACTORY_H
#define QSERVICEFACTORY_H

#include "singleton.h"
#include "xmppservice.h"
#include "listmodel.h"

#include <QObject>


class QServiceFactory : public QObject
{
friend class Singleton<QServiceFactory>;

    Q_OBJECT
public:
    static QServiceFactory& instance()
    {
        return Singleton<QServiceFactory>::Instance();
    }

    QXmppService& xmpp_service() {return m_xmpp_service;}

    QListModel&  list_model() {return *m_list_model; }

signals:
    
public slots:
    
private:
    explicit QServiceFactory(QObject *parent = 0);

private:
    QXmppService m_xmpp_service;
    QListModel*    m_list_model;
};

#endif // QSERVICEFACTORY_H
