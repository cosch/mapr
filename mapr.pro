# Add more folders to ship with the application, here
folder_01.source = qml/mapr
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

XMPP_BASE = $$PWD/libs/xmpp/
QXMPP_INCLUDEPATH  = $$XMPP_BASE/qxmpp/src/base
QXMPP_INCLUDEPATH += $$XMPP_BASE/qxmpp/src/client
QXMPP_INCLUDEPATH += $$XMPP_BASE/qxmpp/src/server

CONFIG(debug, debug|release) {
    LIBS += $$PWD/libs/linux/debug/libqxmpp_d.so.0.7.6
}
else {
    LIBS += $$PWD/libs/linux/release/libqxmpp.so.0.7.6
}

INCLUDEPATH += $$QXMPP_INCLUDEPATH
INCLUDEPATH += $$PWD/ui

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
CONFIG += mobility
MOBILITY += location

QT +=network xml

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    ui/mapwidget.cpp \
    ui/listmodel.cpp \
    ui/mapitem.cpp \
    ui/mynotifier.cpp \
    service/qservicefactory.cpp \
    service/qxmppservice.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/mapr/Menu.qml \
    qml/mapr/ViewBuddies.qml \
    room-log-pidgin.xml

HEADERS += \
    ui/mapwidget.h \
    ui/listmodel.h \
    ui/mapitem.h \
    ui/mynotifier.h \
    service/qservicefactory.h \
    service/singleton.h \
    service/qxmppservice.h
