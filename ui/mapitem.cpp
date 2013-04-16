#include "mapitem.h"

QMapItem::QMapItem(QObject *parent) :
    QListItem(parent)
{
}

QMapItem::QMapItem(const QString &name, const qreal &geoX, const qreal &geoY, QObject *parent) :
    QListItem(parent),
    m_name(name),
    m_geoX(geoX),
    m_geoY(geoY)
{

}

void QMapItem::setName(const QString &name)
{
    m_name = name;
    emit dataChanged();
}

void QMapItem::setGeo(const qreal &geoX, const qreal &geoY)
{
  if(m_geoX != geoX || m_geoY != geoY) {
    m_geoX=geoX;
    m_geoY=geoY;
    emit dataChanged();
  }
}

QHash<int, QByteArray> QMapItem::roleNames() const
{
  QHash<int, QByteArray> names;
  names[NameRole] = "name";
  names[GeoXRole] = "geoX";
  names[GeoYRole] = "geoY";
  return names;
}

QVariant QMapItem::data(int role) const
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
