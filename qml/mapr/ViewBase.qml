import QtQuick 1.1

Rectangle {
    anchors.fill: parent
    color: "white"
    visible: true

    NaviBar {
        id: navi_bar
    }

    /* this is the menu shadow */
    BorderImage {
        id: menu_shadow_
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: -10
        z: -1 /* this will place it below normal_view_ */
        visible: main.menu_shown
        source: "shadow.png"
        border { left: 12; top: 12; right: 12; bottom: 12 }
    }

    /* put this last to "steal" touch on the normal window when menu is shown */
    MouseArea {
        anchors.fill: parent
        enabled: main.menu_shown
        onClicked: main.toggleMenu();
    }

    MouseArea {
      id: mousearea
      enabled: !main.menu_shown

      property bool isFromLeft: false
      property bool isFromRight: false

      anchors { top: naviBar().bottom; bottom: parent.bottom; left: parent.left; right: parent.right}

      onPressed: {
          console.log("ViewBase mouse pressed:"+mouse.x)
          if(mouse.x<=20)
            isFromLeft = true
          else
          if(mouse.x>main.width-20)
            isFromRight = true
      }

      onReleased: {
          if( isFromLeft ) {
            console.log("ViewBase mouse from left")
            onMoveFromLeft();
            isFromLeft = false
          } else
          if( isFromRight ) {
            console.log("ViewBase mouse from right")
            onMoveFromRight();
            isFromRight = false
          }
      }

      onPositionChanged: {

      }

      onCanceled: {
         isFromLeft = false;
      }
   }

    function naviBar() {
        return navi_bar;
    }

    function onMoveFromLeft() {
        main.showMenu();
    }

    function onMoveFromRight() {
        main.hideMenu()
    }
}

