import QtQuick 1.1

Rectangle {
    id: menu_bar_
    anchors.top: parent.top
    width: parent.width; height: 100; color: "darkBlue"
    Rectangle {
        id: menu_button_
        anchors {left: parent.left; verticalCenter: parent.verticalCenter; margins: 24 }
        color: "white"; width: 64; height: 64; smooth: true
        scale: ma_.pressed ? 1.2 : 1
        Text { anchors.centerIn: parent; font.pixelSize: 48; text: "!" }
        MouseArea { id: ma_; anchors.fill: parent; onClicked: main.toggleMenu(); }
    }
}
