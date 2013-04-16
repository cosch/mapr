#ifndef MAP_WIDGET_H
#define MAP_WIDGET_H

#include <QGraphicsGeoMap>
#include <QGeoMappingManager>
#include <QGeoMapCircleObject>
#include <QGeoMapObject>
#include <QGeoMapPixmapObject>

//#include "poi_list_model.h"
//#include "data_manager.h"

QTM_USE_NAMESPACE

class QMapItem;
class QListModel;

class QMapWidget : public QGraphicsGeoMap
{
    Q_OBJECT

    Q_PROPERTY(QObject* datamodel READ datamodel WRITE setDatamodel NOTIFY datamodelChanged)

public:
    QMapWidget();
    ~QMapWidget();

    void setDatamodel(QObject *model);
    QObject* datamodel();

    void addMapItem(QMapItem *item);
    //void removePoi(PoiData *poi);
    //void clearPois();

signals:
    void poiClicked(QString uuid);
    void datamodelChanged(QObject* m);

protected:
    void mousePressEvent(QGraphicsSceneMouseEvent* event);
    void mouseReleaseEvent(QGraphicsSceneMouseEvent* event);
    void mouseMoveEvent(QGraphicsSceneMouseEvent* event);

private:
    static QGeoMappingManager* createManager();

private:
    QPointF mLastPos;
    QListModel* m_datamodel;
};

#endif // MAP_WIDGET_H
