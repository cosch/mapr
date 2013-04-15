#include <QApplication>
#include <QDeclarativeItem>
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"

#include "native/mapwidget.h"
#include "native/listmodel.h"
#include "native/mapitem.h"
#include "native/mynotifier.h"

#include "QXmppClient.h"
#include "QXmppMucManager.h"

static ListModel* g_model = NULL;


ListModel* getModel() {
  qDebug() << "INFO: getModel" << g_model;
  if( g_model==NULL) {
    qDebug() << "INFO: getModel - g_model was null";
    g_model= new ListModel(new MapItem, qApp);
    g_model->appendRow(new MapItem("txtr", 53.12,13.52, g_model));
    qDebug() << "INFO: getModel" << g_model;
  }
  return g_model;
}

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;

    QXmppClient xmppClient;
    xmppClient.configuration().setJid("footest@jabber.org");
    xmppClient.configuration().setPassword("footest23");
    QXmppLogger::getLogger()->setLoggingType(QXmppLogger::StdoutLogging);
    xmppClient.connectToServer(xmppClient.configuration());

    QXmppMucManager* mucMan = xmppClient.findExtension<QXmppMucManager>();
    if( !mucMan )
    {
        mucMan = new QXmppMucManager();
        if( !xmppClient.addExtension(mucMan) )
        {
            delete mucMan;
            mucMan=NULL;
        }
    }
    qDebug() << " mucMan:" << mucMan;
    QList<QXmppMucRoom*> rooms = mucMan->rooms();

    MyNotifier myNotifier;
    QObject::connect( &xmppClient, SIGNAL(stateChanged(QXmppClient::State)), &myNotifier, SLOT(notifyStateChange(QXmppClient::State)) );

    viewer.rootContext()->setContextProperty("mapModel",  getModel());
    viewer.rootContext()->setContextProperty("xmppClient",  &xmppClient);
    viewer.rootContext()->setContextProperty("notifier", &myNotifier);
    viewer.rootContext()->setContextProperty("mucMan", mucMan);

    //qmlRegisterMetaType<QXmppClient::State>("xmppClient::State");
    qmlRegisterType<MapWidget>("maprwidgets", 1, 0, "MyMap");


    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/mapr/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
