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
                    right: page.right
                    rightMargin: 10
                }
                isHorizontal: root._horizontalToolbar
                buttons: [
                    { label: "Foo", icon: "" },
                    { label: "", icon: "\ue901" },
                    { label: "Bar", icon: "" },
                    { label: "", icon: "\ue903" },
                    { label: "Baz", icon: "" },
                    { label: "", icon: "\ue905" }
                ]
                onClicked: function (index) {
                    switch (index) {
                    case 0:
                        root._horizontalToolbar = root._horizontalToolbar;
                        break;
                    case 1:
                        root._currentColor = "red";
                        break;
                    case 2:
                        root._currentColor = "blue";
                        break;
                    case 3:
                        root._currentColor = "green";
                        break;
                    case 4:
                        root._currentColor = "yellow";
                        break;
                    case 5:
                        root._currentColor = "white";
                        break;
                    }
                }
            }

            Rectangle {
                anchors {
                    top: root._horizontalToolbar ? toolbar.bottom : page.top
                    topMargin: 50
                    bottom: page.bottom
                    left: root._horizontalToolbar ? page.left : toolbar.right
                    right: page.right
                }
                color: root._currentColor
            }
        }
    }
}
