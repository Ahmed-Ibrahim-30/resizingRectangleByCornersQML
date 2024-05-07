import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id:widnow
    visible: true
    width: 1000
    height: 700

    Rectangle {
        id: resizableRect
        width: 200
        height: 150
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        color: "lightblue"
        border.color: "black"

        // Function to constrain width and height to a minimum size
        function enforceMinimumSize() {
            width = Math.max(width, 50)
            height = Math.max(height, 50)
        }

        // Corner size
        readonly property int cornerSize: 15
        readonly property int mnHeight: 50
        readonly property int mnWidth : 50

        // Top-left corner
        Rectangle {
            id: topLeft
            width: resizableRect.cornerSize
            height: resizableRect.cornerSize
            anchors.left: parent.left
            anchors.top: parent.top
            color: "gray"
            border.color: "black"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeFDiagCursor
                property double recX2: resizableRect.width+resizableRect.x
                property double recY2: resizableRect.height+resizableRect.y
                onPositionChanged: {
                    if(resizableRect.width-mouse.x>resizableRect.mnWidth){
                        var newWidth=resizableRect.width-mouse.x
                        resizableRect.x =recX2-newWidth
                        resizableRect.width = newWidth
                    }
                    if(resizableRect.height-mouse.y>resizableRect.mnHeight){
                        var newHeight=resizableRect.height-mouse.y
                        resizableRect.y =recY2-newHeight
                        resizableRect.height = newHeight
                    }
                }
            }
        }

        // Top-right corner
        Rectangle {
            id: topRight
            width: resizableRect.cornerSize
            height: resizableRect.cornerSize
            anchors.right: parent.right
            anchors.top: parent.top
            color: "gray"
            border.color: "black"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeBDiagCursor
                property double recX1: resizableRect.x
                property double recY2: resizableRect.height+resizableRect.y
                onPositionChanged: {
                    if(resizableRect.width+mouse.x>resizableRect.mnWidth){
                        resizableRect.width += mouse.x
                        resizableRect.x=recX1
                    }
                    if(resizableRect.height-mouse.y>resizableRect.mnHeight){
                        var newHeight=resizableRect.height-mouse.y
                        resizableRect.y =recY2-newHeight
                        resizableRect.height = newHeight
                    }
                }
            }
        }

        // Bottom-left corner
        Rectangle {
            id: bottomLeft
            width: resizableRect.cornerSize
            height: resizableRect.cornerSize
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            color: "gray"
            border.color: "black"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeBDiagCursor
                property double recX2: resizableRect.width+resizableRect.x
                property double recY1: resizableRect.y
                onPositionChanged: {
                    var newHeight=resizableRect.height+mouse.y
                    var newWidth=resizableRect.width-mouse.x
                    if(newWidth>resizableRect.mnWidth){
                        resizableRect.x =recX2-newWidth
                        resizableRect.width = newWidth
                    }
                    if(newHeight>resizableRect.mnHeight){
                        resizableRect.y =recY1
                        resizableRect.height = newHeight
                    }
                }
            }
        }

        // Bottom-right corner
        Rectangle {
            id: bottomRight
            width: resizableRect.cornerSize
            height: resizableRect.cornerSize
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: "gray"
            border.color: "black"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeFDiagCursor
                property double recX1: resizableRect.x
                property double recY1: resizableRect.y
                onPositionChanged: {
                    var newHeight=resizableRect.height+mouse.y
                    var newWidth=resizableRect.width+mouse.x

                    if(newWidth>resizableRect.mnWidth){
                        resizableRect.x =recX1
                        resizableRect.width = newWidth
                    }
                    if(newHeight>resizableRect.mnHeight){
                        resizableRect.y =recY1
                        resizableRect.height = newHeight
                    }
                }
            }
        }
    }
}
