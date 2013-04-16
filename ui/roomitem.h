#ifndef ROOMITEM_H
#define ROOMITEM_H

#include "listmodel.h"
#include "QXmppMucManager.h"

class QRoomItem: public QListItem
{
    Q_OBJECT

public:
  enum Roles {
    NameRole = Qt::UserRole+1,
    joinedRole
  };

public:
  QRoomItem(QObject *parent = 0);
  explicit QRoomItem(const QString &name, QXmppMucRoom* room=0, QObject *parent = 0);

  QVariant data(int role) const;
  QHash<int, QByteArray> roleNames() const;
  inline QString id() const { return m_name; }

  void setName(const QString &name);
  void setRoom(QXmppMucRoom* room);

  inline QString name() const { return m_name; }
  bool joined() const;

signals:

public slots:
  void roomDataChanged() { emit dataChanged(); }

private:
  QString m_name;
  QXmppMucRoom* m_room;
};

#endif // ROOMITEM_H
