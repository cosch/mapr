# Add more folders to ship with the application, here
folder_01.source = qml/mapr
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
CONFIG += mobility
MOBILITY += location

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    native/mapwidget.cpp \
    native/listmodel.cpp \
    native/mapitem.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/mapr/Menu.qml \
    qml/mapr/ViewBuddies.qml

HEADERS += \
    native/mapwidget.h \
    native/listmodel.h \
    native/mapitem.h
