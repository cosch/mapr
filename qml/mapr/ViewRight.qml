import QtQuick 1.1

ViewBase {
    property ViewBase left_view: null
    z: 0

    Component.onCompleted: {
        naviBar().isRightView()
    }

    /* this is what moves the normal view aside */
    transform: Translate {
        id: view_mover
        x:  2*main.width //* 0.9
        Behavior on x { NumberAnimation { duration: 400; easing.type: Easing.OutQuad } }
    }

    function moveX(x) {
        console.log("ViewRight moveX:"+x+":"+main.width)
        view_mover.x = x
        left_view.moveX(x-main.width)
    }

    function onMoveFromLeft() {
        moveX(main.width)
    }
}
