import QtQuick 1.1

Rectangle {
    anchors.top: parent.top
    width: parent.width;
    height: Math.max(parent.height/10,50);
    color: "#303030"

    signal viewLeftClicked;
    signal viewRightClicked;

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
        id: view_button_left
        anchors {left: menu_button.right; verticalCenter: parent.verticalCenter; margins: 24 }
        color: "white"; width: parent.height-parent.height/10; height: parent.height-parent.height/10; smooth: true
        scale: ma_view_left.pressed ? 1.2 : 1
        Text { id:view_button_left_text; anchors.centerIn: parent; font.pixelSize: parent.height-parent.height/8; text: "!" }
        MouseArea {
            id: ma_view_left;
            anchors.fill: view_button_left;
            onClicked: {
                console.log("NaviBar ViewButtonLeft mouse pressed:"+mouse.x)
                onMoveFromLeft();
            }
        }
    }

    Rectangle {
        id: view_button_right
        anchors {left: view_button_left.right; verticalCenter: parent.verticalCenter; margins: 24 }
        color: "white"; width: parent.height-parent.height/10; height: parent.height-parent.height/10; smooth: true
        scale: ma_view_right.pressed ? 1.2 : 1
        Text { id:view_button_right_text; anchors.centerIn: parent; font.pixelSize: parent.height-parent.height/8; text: "!" }
        MouseArea {
            id: ma_view_right;
            anchors.fill: view_button_right;
            onClicked: {
                console.log("NaviBar ViewButtonRight mouse pressed:"+mouse.x)
                onMoveFromRight();
            }
        }
    }

    function setViewButtonLeft(v) {
        view_button_left_text.text=v;
    }

    function setViewButtonRight(v) {
        view_button_right_text.text=v;
    }

    function isLeftView() {
        menu_button.enabled=true;
        view_button_left.enabled=false;
        view_button_right.enabled=true;

        menu_button.color= "white"
        view_button_left.color= "lightBlue"
        view_button_right.color= "white"
    }

    function isRightView() {
        menu_button.enabled=false;
        view_button_left.enabled=true;
        view_button_right.enabled=false;

        menu_button.color= "white"
        view_button_left.color= "white"
        view_button_right.color= "lightBlue"
    }
}
