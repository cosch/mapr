#include "roomitem.h"

QRoomItem::QRoomItem(QObject *parent) :
    QListItem(parent)
{
}

QRoomItem::QRoomItem(const QString &name, QObject *parent) :
    QListItem(parent),
    m_name(name)
{

}

void QRoomItem::setName(const QString &name)
{
    m_name = name;
    emit dataChanged();
}

QHash<int, QByteArray> QRoomItem::roleNames() const
{
  QHash<int, QByteArray> names;
  names[NameRole] = "name";
  return names;
}

QVariant QRoomItem::data(int role) const
{
  switch(role) {
  case NameRole:
    return name();
  default:
    return QVariant();
  }
}
