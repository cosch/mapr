#ifndef ROOMITEM_H
#define ROOMITEM_H

#include "listmodel.h"

class QRoomItem: public QListItem
{
    Q_OBJECT

public:
  enum Roles {
    NameRole = Qt::UserRole+1
  };

public:
  QRoomItem(QObject *parent = 0);
  explicit QRoomItem(const QString &name, QObject *parent = 0);

  QVariant data(int role) const;
  QHash<int, QByteArray> roleNames() const;
  inline QString id() const { return m_name; }

  void setName(const QString &name);

  inline QString name() const { return m_name; }

signals:

public slots:

private:
  QString m_name;
};

#endif // ROOMITEM_H
