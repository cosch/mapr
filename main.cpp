#include <QApplication>
#include <QDeclarativeItem>
#include "qmlapplicationviewer.h"
#include "native/mapwidget.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    qmlRegisterType<MapWidget>("maprwidgets", 1, 0, "Map");
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/mapr/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
