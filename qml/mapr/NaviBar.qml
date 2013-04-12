import QtQuick 1.1

Rectangle {
    anchors.top: parent.top
    width: parent.width;
    height: Math.max(parent.height/10,50);
    color: "darkBlue"

    Rectangle {
        id: menu_button_
        anchors {left: parent.left; verticalCenter: parent.verticalCenter; margins: 24 }
        color: "white"; width: parent.height-parent.height/10; height: parent.height-parent.height/10; smooth: true
        scale: ma_.pressed ? 1.2 : 1
        Text { anchors.centerIn: parent; font.pixelSize: parent.height-parent.height/8; text: "!" }
        MouseArea {
            id: ma_;
            anchors.fill: menu_button_;
            onClicked: {
                console.log("NaviBar mouse pressed:"+mouse.x)
                main.toggleMenu();
            }
        }
    }
}
