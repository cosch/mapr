import QtQuick 1.1

ViewLeft {
    color: "LightGrey"
    Component.onCompleted: {
        naviBar().setViewButtonLeft("B")
        naviBar().view_button_right.visible=false
    }
    /* this is my sample "normal" contant (TODO: replace with your own)  */
//    GridView {
//        anchors { top: naviBar().bottom; bottom: parent.bottom; left: parent.left; right: parent.right; margins: 30 }
//        clip: true; model : 20;
//        delegate: Rectangle { width: 80; height: 80; color: Qt.rgba( Math.random(), Math.random(), Math.random(), 1) }
//    }
    ListView {
        anchors { top: naviBar().bottom; bottom: parent.bottom; left: parent.left; right: parent.right; margins: 30 }
        model: roomModel
        delegate: Item {
            height: 22; width: parent.width;
            Text {
                anchors {
                    left: parent.left;
                    leftMargin: 12;
                    verticalCenter: parent.verticalCenter
                }
                color: "white";
                font.pixelSize: 16;
                text: name + ".." + joined
            }
            Rectangle {
                height: 2;
                width: parent.width * 0.7;
                color: "gray";
                anchors {
                    horizontalCenter: parent.horizontalCenter;
                    bottom: parent.bottom
                }
            }
        }
    }
}
