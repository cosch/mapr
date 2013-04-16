#include "listmodel.h"

QListModel::QListModel(QListItem* prototype, QObject *parent) :
    QAbstractListModel(parent), m_prototype(prototype)
{
  setRoleNames(m_prototype->roleNames());
}

int QListModel::rowCount(const QModelIndex &parent) const
{
  Q_UNUSED(parent);
  return m_list.size();
}

QVariant QListModel::data(const QModelIndex &index, int role) const
{
  if(index.row() < 0 || index.row() >= m_list.size())
    return QVariant();
  return m_list.at(index.row())->data(role);
}

QListModel::~QListModel() {
  delete m_prototype;
  clear();
}

void QListModel::appendRow(QListItem *item)
{
  appendRows(QList<QListItem*>() << item);
}

void QListModel::appendRows(const QList<QListItem *> &items)
{
  beginInsertRows(QModelIndex(), rowCount(), rowCount()+items.size()-1);
  foreach(QListItem *item, items) {
    connect(item, SIGNAL(dataChanged()), SLOT(handleItemChange()));
    m_list.append(item);
  }
  endInsertRows();
}

void QListModel::insertRow(int row, QListItem *item)
{
  beginInsertRows(QModelIndex(), row, row);
  connect(item, SIGNAL(dataChanged()), SLOT(handleItemChange()));
  m_list.insert(row, item);
  endInsertRows();
}

void QListModel::handleItemChange()
{
  QListItem* item = static_cast<QListItem*>(sender());
  QModelIndex index = indexFromItem(item);
  if(index.isValid())
    emit dataChanged(index, index);
}

QListItem * QListModel::find(const QString &id) const
{
  foreach(QListItem* item, m_list) {
    if(item->id() == id) return item;
  }
  return 0;
}

QModelIndex QListModel::indexFromItem(const QListItem *item) const
{
  Q_ASSERT(item);
  for(int row=0; row<m_list.size(); ++row) {
    if(m_list.at(row) == item) return index(row);
  }
  return QModelIndex();
}

void QListModel::clear()
{
  qDeleteAll(m_list);
  m_list.clear();
}

bool QListModel::removeRow(int row, const QModelIndex &parent)
{
  Q_UNUSED(parent);
  if(row < 0 || row >= m_list.size()) return false;
  beginRemoveRows(QModelIndex(), row, row);
  delete m_list.takeAt(row);
  endRemoveRows();
  return true;
}

bool QListModel::removeRows(int row, int count, const QModelIndex &parent)
{
  Q_UNUSED(parent);
  if(row < 0 || (row+count) >= m_list.size()) return false;
  beginRemoveRows(QModelIndex(), row, row+count-1);
  for(int i=0; i<count; ++i) {
    delete m_list.takeAt(row);
  }
  endRemoveRows();
  return true;
}

QListItem * QListModel::takeRow(int row)
{
  beginRemoveRows(QModelIndex(), row, row);
  QListItem* item = m_list.takeAt(row);
  endRemoveRows();
  return item;
}

QListItem* QListModel::itemAt(int index)
{
    return m_list[index];
}
