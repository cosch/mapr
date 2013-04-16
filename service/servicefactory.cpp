#include "servicefactory.h"
#include "mapitem.h"

QServiceFactory::QServiceFactory(QObject *parent) :
    QObject(parent),
    m_list_model( new QListModel(new QMapItem, this) )
{
    m_list_model->appendRow(new QMapItem("txtr1", 53.12,13.52, m_list_model));
}
