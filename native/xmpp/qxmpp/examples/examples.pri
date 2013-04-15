include(../qxmpp.pri)

TEMPLATE = app
CONFIG += console

QMAKE_LIBDIR += ../../src
INCLUDEPATH += $$QXMPP_INCLUDEPATH
#LIBS += $$QXMPP_LIBS
LIBS += ../../../libs/linux/release/libqxmpp.so.0

# Symbian packaging rules
symbian {
    vendorinfo = \
        "; Localised Vendor name" \
        "%{\"QXmpp\"}" \
        " " \
        "; Unique Vendor name" \
        ":\"QXmpp\"" \
        " "

    examples_deployment.pkg_prerules += vendorinfo
    DEPLOYMENT += examples_deployment

    TARGET.CAPABILITY = "NetworkServices"
}
