import QtQuick 1.1
import maprwidgets 1.0

ViewBase {

    MyMap {
        id: map
        anchors { top: naviBar().bottom; bottom: parent.bottom; left: parent.left; right: parent.right; margins: 30 }

//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                Qt.quit();
//            }
//        }

        Component.onCompleted: {
            //map.updateFromModel(mapModel)
        }

        PinchArea {
            id: pinch

            anchors.fill: map

            property real zoomLevel: 0
            property variant zPos

            onPinchStarted: {
                zoomLevel = map.zoomLevel;
                zPos = Qt.point(pinch.center.x, pinch.center.y);
            }

            onPinchUpdated: {
                map.zoomLevel = zoomLevel + Math.log(pinch.scale)/Math.log(2);

                map.center = map.toCoordinate(Qt.point(-pinch.center.x + zPos.x + map.width/2,
                                                       -pinch.center.y + zPos.y + map.height/2));

                zPos = Qt.point(pinch.center.x, pinch.center.y);
            }
        }

        MouseArea {
          id: mousearea

          property bool __isPanning: false
          property int __lastX: -1
          property int __lastY: -1

          anchors.fill : map

          onPressed: {
             __isPanning = true
             __lastX = mouse.x
             __lastY = mouse.y
          }

          onReleased: {
             __isPanning = false
          }

          onPositionChanged: {
             if (__isPanning) {
                var dx = mouse.x - __lastX
                var dy = mouse.y - __lastY
                map.pan(-dx, -dy)
                __lastX = mouse.x
                __lastY = mouse.y
             }
          }

          onCanceled: {
             __isPanning = false;
          }
       }

    }
}
