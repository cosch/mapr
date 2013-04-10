import QtQuick 1.0

Rectangle {
    id: main

    width: 460
    height: 640
    color: "black"

    property bool menu_shown: false
    property ViewBase current_view : map_view

    Menu {
        id: menu_view
    }


    ViewBuddies {
        id: buddies_view
    }

    ViewMap {
        id: map_view
    }


    Component.onCompleted: {
        current_view.visible = true
    }

    /* this functions toggles the menu and starts the animation */
    function toggleMenu() {
        current_view.moveX( main.menu_shown ? 0 : main.width * 0.9 )
        main.menu_shown = !main.menu_shown;
    }

    function activateView(v) {
        var view;

        switch (v) {
           case "buddies_view":
                    view = buddies_view
                          break;
           case "map_view":
                    view = map_view
                          break;
        }
        current_view.visible=false
        current_view = view
        current_view.visible=true

        toggleMenu()
    }
}
