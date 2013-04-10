/* slide menu example by av // tube42.se */
import QtQuick 1.0

Rectangle {
    id: main

    width: 460
    height: 640
    color: "black"

    property bool menu_shown: false

    /* this is what moves the normal view aside */
    transform: Translate {
        id: menu_mover
        x: 0
        Behavior on x { NumberAnimation { duration: 400; easing.type: Easing.OutQuad } }
    }

    /* this rectangle contains the "menu" */
    Menu {
        id: menu_view
    }

    /* this rectangle contains the "normal" view in your app */
    Buddies {
        id: budies_view

        /* quick and dirty menu "button" for this demo (TODO: replace with your own) */
        NaviBar {
            id: navi_bar
        }
    }

    Component.onCompleted: onMenu()
    /* this functions toggles the menu and starts the animation */
    function onMenu()
    {
        menu_mover.x = main.menu_shown ? 0 : main.width * 0.9
        main.menu_shown = !main.menu_shown;
    }
}
