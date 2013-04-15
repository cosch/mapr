#ifndef MAPITEM_H
#define MAPITEM_H

#include <QString>

#include "listmodel.h"

class MapItem : public ListItem
{
    Q_OBJECT

public:
  enum Roles {
    NameRole = Qt::UserRole+1,
    GeoXRole,
    GeoYRole
  };

public:
  MapItem(QObject *parent = 0);
  explicit MapItem(const QString &name, const qreal &geoX, const qreal &geoY, QObject *parent = 0);

  QVariant data(int role) const;
  QHash<int, QByteArray> roleNames() const;
  inline QString id() const { return m_name; }

  void setName(const QString &name);
  void setGeo(const qreal &geoX, const qreal &geoY);

  inline QString name() const { return m_name; }
  inline qreal geoX() const { return m_geoX; }
  inline qreal geoY() const { return m_geoY; }

signals:
    
public slots:
    
private:
  QString m_name;
  qreal m_geoX;
  qreal m_geoY;
};

#endif // MAPITEM_H
