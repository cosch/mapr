#include <QDebug>
#include "roomitem.h"

QRoomItem::QRoomItem(QObject *parent) :
    QListItem(parent)
{
}

QRoomItem::QRoomItem(const QString &name, QXmppMucRoom* room, QObject *parent) :
    QListItem(parent),
    m_name(name),
    m_room(NULL)
{
    setRoom(room);
}

void QRoomItem::setName(const QString &name)
{
    m_name = name;
    emit dataChanged();
}

void QRoomItem::setRoom(QXmppMucRoom* room)
{
    bool check;
    Q_UNUSED(check);

    if( m_room )
    {
        check = QObject::disconnect( m_room, SIGNAL(isJoinedChanged()), this, SLOT(roomDataChanged()) );
        Q_ASSERT(check);
    }

    m_room=room;
    emit dataChanged();

    if( m_room )
    {
        check = QObject::connect( m_room, SIGNAL(isJoinedChanged()), this, SLOT(roomDataChanged()) );
        Q_ASSERT(check);
    }
}

bool QRoomItem::joined() const
{
    qDebug() << "m_room" << m_room << " joined:" << (m_room && m_room->isJoined());
    return m_room && m_room->isJoined();
}

QHash<int, QByteArray> QRoomItem::roleNames() const
{
  QHash<int, QByteArray> names;
  names[NameRole] = "name";
  names[joinedRole] = "joined";
  return names;
}

QVariant QRoomItem::data(int role) const
{
  switch(role) {
  case NameRole:
    return name();
  case joinedRole:
    return joined();
  default:
    return QVariant();
  }
}
