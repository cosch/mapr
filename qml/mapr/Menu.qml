import QtQuick 1.1

Rectangle {
    anchors.fill: parent
    //color: "#303030"
    color: "black"
    opacity: main.menu_shown ? 1 : 0
    Behavior on opacity { NumberAnimation { duration: 300 } }

    /* this is my sample menu content (TODO: replace with your own)  */
    ListView {
        anchors { fill: parent; margins: 22 }
        model: 8
        delegate: Item { height: 80; width: parent.width;
            Text { anchors { left: parent.left; leftMargin: 12; verticalCenter: parent.verticalCenter }
                color: "white"; font.pixelSize: 32; text: "This is menu #" + index  }
            Rectangle { height: 2; width: parent.width * 0.7; color: "gray"; anchors { horizontalCenter: parent.horizontalCenter; bottom: parent.bottom } }
        }
    }
}
