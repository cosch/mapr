#include <QApplication>
#include <QDeclarativeItem>
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"

#include "native/mapwidget.h"
#include "native/listmodel.h"
#include "native/mapitem.h"

static ListModel* g_model = NULL;

ListModel* getModel() {
  if( g_model!=NULL) {
    g_model= new ListModel(new MapItem, qApp);
    g_model->appendRow(new MapItem("txtr", 53.12,13.52, g_model));
  }
  return g_model;
}

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    qmlRegisterType<MapWidget>("maprwidgets", 1, 0, "MyMap");

    viewer.rootContext()->setContextProperty("mapModel",  getModel());
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/mapr/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
