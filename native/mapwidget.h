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

class MapItem;
class ListModel;

class MapWidget : public QGraphicsGeoMap
{
    Q_OBJECT

public:
    MapWidget();
    ~MapWidget();

    Q_INVOKABLE void updateFromModel(ListModel* model);

    void addMapItem(MapItem *item);
    //void removePoi(PoiData *poi);
    //void clearPois();

signals:
    void poiClicked(QString uuid);

protected:
    void mousePressEvent(QGraphicsSceneMouseEvent* event);
    void mouseReleaseEvent(QGraphicsSceneMouseEvent* event);
    void mouseMoveEvent(QGraphicsSceneMouseEvent* event);

private:
    static QGeoMappingManager* createManager();

private:
    QPointF mLastPos;
};

#endif // MAP_WIDGET_H
