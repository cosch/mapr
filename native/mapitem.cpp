#include "mapitem.h"

MapItem::MapItem(QObject *parent) :
    ListItem(parent)
{
}

MapItem::MapItem(const QString &name, const qreal &geoX, const qreal &geoY, QObject *parent) :
    ListItem(parent),
    m_name(name),
    m_geoX(geoX),
    m_geoY(geoY)
{

}

void MapItem::setName(const QString &name)
{
    m_name = name;
    emit dataChanged();
}

void MapItem::setGeo(const qreal &geoX, const qreal &geoY)
{
  if(m_geoX != geoX || m_geoY != geoY) {
    m_geoX=geoX;
    m_geoY=geoY;
    emit dataChanged();
  }
}

QHash<int, QByteArray> MapItem::roleNames() const
{
  QHash<int, QByteArray> names;
  names[NameRole] = "name";
  names[GeoXRole] = "geoX";
  names[GeoYRole] = "geoY";
  return names;
}

QVariant MapItem::data(int role) const
{
  switch(role) {
  case NameRole:
    return name();
  case GeoXRole:
    return geoY();
  case GeoYRole:
    return geoY();
  default:
    return QVariant();
  }
}
