import QtQuick 1.1

Rectangle {
    anchors.fill: parent
    color: "white"

    /* quick and dirty menu "button" for this demo (TODO: replace with your own) */
    NaviBar {
        id: navi_bar
    }

    /* this is the menu shadow */
    BorderImage {
        id: menu_shadow_
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: -10
        z: -1 /* this will place it below normal_view_ */
        visible: main.menu_shown
        source: "shadow.png"
        border { left: 12; top: 12; right: 12; bottom: 12 }
    }

    /* this is what moves the normal view aside */
    transform: Translate {
        id: menu_mover
        x: 0
        Behavior on x { NumberAnimation { duration: 400; easing.type: Easing.OutQuad } }
    }

    /* put this last to "steal" touch on the normal window when menu is shown */
    MouseArea {
        anchors.fill: parent
        enabled: main.menu_shown
        onClicked: main.toggleMenu();
    }

    function moveX(x) {
        menu_mover.x = x
    }

    function naviBar() {
        return navi_bar;
    }

}

