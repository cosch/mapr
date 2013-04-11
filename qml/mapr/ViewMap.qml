import QtQuick 1.1
import maprwidgets 1.0

ViewBase {

    Map {
        anchors { top: naviBar().bottom; bottom: parent.bottom; left: parent.left; right: parent.right; margins: 30 }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit();
            }
        }
    }
}
