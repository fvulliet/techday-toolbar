pragma ComponentBehavior: Bound
import QtQuick
import "./components" as Components

Window {
    id: root

    width: 800
    height: 1280
    visible: true
    title: qsTr("techDay Toolbar")

    property color _currentColor: "white"
    property bool _horizontalToolbar: true
    property string _icon: ""

    FontLoader {
        id: icomoonFont
        source: "qrc:/fonts/icomoon.ttf"
    }

    Components.Frame {
        id: frame
        anchors {
            fill: parent
            margins: 42
        }
        borderColor: "#5e5e5e"
        backgroundColor: "#e4e4e4"
        screenColor: "#d4d4d4"
        cornerRadius: 24
        loadedComponent:  Item {
            id: page

            Components.Toolbar {
                id: toolbar
                anchors {
                    top: page.top
                    topMargin: 10
                    left: page.left
                    leftMargin: 10
                }
                isHorizontal: root._horizontalToolbar
                buttons: [
                    { label: "Flip", icon: "" },
                    { label: "", icon: "\ue928" },
                    { label: "Blue", icon: "" },
                    { label: "", icon: "\ue929" },
                    { label: "Yellow", icon: "" },
                    { label: "", icon: "\ue92b" }
                ]
                onClicked: function (index) {
                    toolbar.currentIndex = index;
                    switch (index) {
                    case 0:
                        root._horizontalToolbar = !root._horizontalToolbar;
                        break;
                    case 1:
                        root._currentColor = "white";
                        root._icon = "\ue928";
                        icon.color = "yellow";
                        break;
                    case 2:
                        root._currentColor = "blue";
                        root._icon = "";
                        break;
                    case 3:
                        root._currentColor = "white";
                        root._icon = "\ue929";
                        icon.color = "blue";
                        break;
                    case 4:
                        root._currentColor = "yellow";
                        root._icon = "";
                        break;
                    case 5:
                        root._currentColor = "white";
                        root._icon = "\ue92b";
                        icon.color = "black";
                        break;
                    }
                }
            }

            Rectangle {
                anchors {
                    top: root._horizontalToolbar ? toolbar.bottom : page.top
                    topMargin: 10
                    bottom: page.bottom
                    bottomMargin: 10
                    left: root._horizontalToolbar ? page.left : toolbar.right
                    leftMargin: 10
                    right: page.right
                    rightMargin: 10
                }
                color: root._currentColor

                Text {
                    id: icon
                    font {
                        pixelSize: 256
                        family: "icomoon"
                    }
                    text: root._icon
                    color: "black"
                    anchors.centerIn: parent
                    visible: text.length > 0
                }
            }
        }
    }
}
