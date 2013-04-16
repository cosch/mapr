#ifndef LISTMODEL_H
#define LISTMODEL_H
#include <QAbstractListModel>
#include <QList>
#include <QVariant>

class QListItem: public QObject {
  Q_OBJECT

public:
  QListItem(QObject* parent = 0) : QObject(parent) {}
  virtual ~QListItem() {}

  virtual QString id() const = 0;
  virtual QVariant data(int role) const = 0;
  virtual QHash<int, QByteArray> roleNames() const = 0;

signals:
  void dataChanged();
};

class QListModel : public QAbstractListModel
{
  Q_OBJECT

public:
  explicit QListModel(QListItem* prototype, QObject* parent = 0);
  ~QListModel();
  int rowCount(const QModelIndex &parent = QModelIndex()) const;
  QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
  void appendRow(QListItem* item);
  void appendRows(const QList<QListItem*> &items);
  void insertRow(int row, QListItem* item);
  bool removeRow(int row, const QModelIndex &parent = QModelIndex());
  bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex());
  QListItem* takeRow(int row);
  QListItem* find(const QString &id) const;
  QModelIndex indexFromItem( const QListItem* item) const;
  void clear();
  QListItem* itemAt(int index);

private slots:
  void handleItemChange();

private:
  QListItem* m_prototype;
  QList<QListItem*> m_list;
};


#endif // LISTMODEL_H
