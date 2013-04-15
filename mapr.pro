# Add more folders to ship with the application, here
folder_01.source = qml/mapr
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

XMPP_BASE = $$PWD/native/xmpp/
QXMPP_INCLUDEPATH = $$XMPP_BASE/qxmpp/src/base $$XMPP_BASE/qxmpp/src/client
QXMPP_INCLUDEPATH +=$$XMPP_BASE/qxmpp/src/server

CONFIG(debug) {
    LIBS += $$XMPP_BASE/libs/linux/debug/libqxmpp_d.so.0.7.6
}
CONFIG(release) {
    LIBS += $$XMPP_BASE/libs/linux/release/libqxmpp.so.0.7.6
}

INCLUDEPATH += $$QXMPP_INCLUDEPATH

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
    native/mapwidget.cpp \
    native/listmodel.cpp \
    native/mapitem.cpp \
    native/mynotifier.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/mapr/Menu.qml \
    qml/mapr/ViewBuddies.qml \
    room-log-pidgin.xml

HEADERS += \
    native/mapwidget.h \
    native/listmodel.h \
    native/mapitem.h \
    native/mynotifier.h
