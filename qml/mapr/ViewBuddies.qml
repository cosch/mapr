import QtQuick 1.1

Rectangle {
    id: budies_view_
    anchors.fill: parent
    color: "white"

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

    /* this is my sample "normal" contant (TODO: replace with your own)  */
    GridView {
        anchors { top: navi_bar.bottom; bottom: parent.bottom; left: parent.left; right: parent.right; margins: 30 }
        clip: true; model : 20;
        delegate: Rectangle { width: 80; height: 80; color: Qt.rgba( Math.random(), Math.random(), Math.random(), 1) }
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
        onClicked: main.onMenu();
    }

    function moveX(x) {
        menu_mover.x = x
    }

}
