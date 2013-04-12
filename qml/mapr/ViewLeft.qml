import QtQuick 1.1

ViewBase {
    property ViewRight right_view: undefined
    z: 0

    Component.onCompleted: {
        naviBar().isLeftView()
    }

    /* this is what moves the normal view aside */
    transform: Translate {
        id: menu_mover
        x: main.width //* 0.9
        Behavior on x { NumberAnimation { duration: 400; easing.type: Easing.OutQuad } }
    }

    function moveX(x) {
        console.log("ViewLeft moveX:"+x+":"+main.width)
        menu_mover.x = x
    }

    function onMoveFromRight() {
        console.log("ViewLeft onMoveFromRight")
        right_view.moveX(0)
    }
}
