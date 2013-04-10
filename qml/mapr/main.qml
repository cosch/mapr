import QtQuick 1.0

Rectangle {
    id: main

    width: 460
    height: 640
    color: "black"

    property bool menu_shown: false
    property string view: "buddies_view"

    /* this rectangle contains the "menu" */
    Menu {
        id: menu_view
    }

    /* this rectangle contains the "normal" view in your app */
    ViewBuddies {
        id: buddies_view
    }

    Component.onCompleted: toggleMenu()
    /* this functions toggles the menu and starts the animation */
    function toggleMenu()
    {
        buddies_view.moveX( main.menu_shown ? 0 : main.width * 0.9 )
        main.menu_shown = !main.menu_shown;
    }
}
