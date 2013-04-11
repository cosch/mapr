import QtQuick 1.1

ViewBase {

    /* this is my sample "normal" contant (TODO: replace with your own)  */
    GridView {
        anchors { top: naviBar().bottom; bottom: parent.bottom; left: parent.left; right: parent.right; margins: 30 }
        clip: true; model : 20;
        delegate: Rectangle { width: 80; height: 80; color: Qt.rgba( Math.random(), Math.random(), Math.random(), 1) }
    }
}
