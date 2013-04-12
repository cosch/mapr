import QtQuick 1.1

ViewRight {
    color: "LightGrey"

    Component.onCompleted: {
        naviBar().setViewButtonLeft("M")
        naviBar().setViewButtonRight("L")
    }

    ListView {
        anchors { top: naviBar().bottom; bottom: parent.bottom; left: parent.left; right: parent.right; margins: 30 }
        model: mapModel

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
                text: name
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
            MouseArea {
                id: ma_;
                anchors.fill: parent;
                onClicked: {
                    console.log("viewlist mouse clicked:"+mouse.x)

                }
            }
        }
    }
}
