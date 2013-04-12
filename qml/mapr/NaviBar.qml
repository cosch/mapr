import QtQuick 1.1

Rectangle {
    anchors.top: parent.top
    width: parent.width;
    height: Math.max(parent.height/10,50);
    color: "#303030"

    Rectangle {
        id: menu_button
        anchors {left: parent.left; verticalCenter: parent.verticalCenter; margins: 24 }
        color: "white"; width: parent.height-parent.height/10; height: parent.height-parent.height/10; smooth: true
        scale: ma_menu.pressed ? 1.2 : 1
        Text { anchors.centerIn: parent; font.pixelSize: parent.height-parent.height/8; text: "!" }
        MouseArea {
            id: ma_menu;
            anchors.fill: menu_button;
            onClicked: {
                console.log("NaviBar MenuButton mouse pressed:"+mouse.x)
                main.toggleMenu();
            }
        }
    }

    Rectangle {
        id: view_button
        visible: false
        anchors {left: menu_button.right; verticalCenter: parent.verticalCenter; margins: 24 }
        color: "white"; width: parent.height-parent.height/10; height: parent.height-parent.height/10; smooth: true
        scale: ma_view.pressed ? 1.2 : 1
        Text { id:view_button_text; anchors.centerIn: parent; font.pixelSize: parent.height-parent.height/8; text: "!" }
        MouseArea {
            id: ma_view;
            anchors.fill: view_button;
            onClicked: {
                console.log("NaviBar ViewButton mouse pressed:"+mouse.x)
                onMoveFromLeft();
            }
        }
    }

    function setViewButton(v) {
        view_button_text.text=v;
        view_button.visible=true;
        menu_button.enabled=false;
    }

}
