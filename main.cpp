#include <QApplication>
#include <QDeclarativeItem>
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"

#include "servicefactory.h"
#include "mapwidget.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;

    viewer.rootContext()->setContextProperty("mapModel",  &QServiceFactory::instance().list_model() );
    viewer.rootContext()->setContextProperty("xmppService", &QServiceFactory::instance().xmpp_service());

    //viewer.rootContext()->setContextProperty("mucMan", mucMan);

    //qmlRegisterMetaType<QXmppClient::State>("xmppClient::State");
    qmlRegisterType<QMapWidget>("maprwidgets", 1, 0, "MyMap");


    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/mapr/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
