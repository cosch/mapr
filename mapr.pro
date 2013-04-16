# Add more folders to ship with the application, here
folder_01.source = qml/mapr
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

XMPP_BASE = $$PWD/libs/xmpp/
QXMPP_INCLUDEPATH  = $$XMPP_BASE/qxmpp/src/base
QXMPP_INCLUDEPATH += $$XMPP_BASE/qxmpp/src/client
QXMPP_INCLUDEPATH += $$XMPP_BASE/qxmpp/src/server

android {
    CONFIG(debug, debug|release) {
        LIBS += $$PWD/libs/android/debug/libqxmpp_d.a
    }
    else {
        LIBS += $$PWD/libs/android/release/libqxmpp.a
    }
}
else {
    CONFIG(debug, debug|release) {
        LIBS += $$PWD/libs/linux/debug/libqxmpp_d.so.0.7.6

        debug_libs.source = libs/linux/debug/libqxmpp_d.so.0.7.6
        debug_libs.target = .
        debug_libs2.source = libs/linux/debug/libqxmpp_d.so.0
        debug_libs2.target = .
        DEPLOYMENTFOLDERS += debug_libs debug_libs2
    }
    else {
        LIBS += $$PWD/libs/linux/release/libqxmpp.so.0.7.6

        rel_libs.source = libs/linux/release/libqxmpp.so.0.7.6
        rel_libs.target = .
        rel_libs2.source = libs/linux/release/libqxmpp.so.0
        rel_libs2.target = .
        DEPLOYMENTFOLDERS += rel_libs rel_libs2
    }
}

INCLUDEPATH += $$QXMPP_INCLUDEPATH
INCLUDEPATH += $$PWD/ui
INCLUDEPATH += $$PWD/service

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
    service/servicefactory.cpp \
    service/xmppservice.cpp \
    ui/roomitem.cpp

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
    service/singleton.h \
    service/servicefactory.h \
    service/xmppservice.h \
    ui/roomitem.h
