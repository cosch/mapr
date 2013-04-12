import QtQuick 1.1

Rectangle {
    anchors.fill: parent
    color: "#303030"
    opacity: main.menu_shown ? 1 : 0
    Behavior on opacity { NumberAnimation { duration: 300 } }

    ListView {
        anchors { fill: parent; margins: 22 }
        model: menuModel

        delegate: Item {
            height: 80; width: parent.width;
            Text {
                anchors {
                    left: parent.left;
                    //leftMargin: 12;
                    horizontalCenter: parent.horizontalCenter;
                    verticalCenter: parent.verticalCenter
                }
                color: "white";
                font.pixelSize: 32;
                text: title
            }
            Rectangle {
                height: 2;
                width: parent.width * 0.7;
                color: "gray";
                anchors {
                    left: parent.left;
                    horizontalCenter: parent.horizontalCenter;
                    bottom: parent.bottom
                }
            }
            MouseArea {
                id: ma_;
                anchors.fill: parent;
                onClicked: {
                    console.log("menu mouse clicked:"+mouse.x)
                    main.activateView(view);
                }
            }
        }
    }

    ListModel {
        id: menuModel
        ListElement { title: "Buddies"; view: "buddies_view"}
        ListElement { title: "Map"; view: "map_view"}
    }
}
