#include <QApplication>
#include <QDeclarativeItem>
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"

#include "native/mapwidget.h"
#include "native/listmodel.h"
#include "native/mapitem.h"

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

    viewer.rootContext()->setContextProperty("mapModel",  getModel());
    qmlRegisterType<MapWidget>("maprwidgets", 1, 0, "MyMap");


    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/mapr/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
