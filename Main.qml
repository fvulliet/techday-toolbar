pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
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
    property bool _showItems: true

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
                    { label: "Flip", icon: "", opacity: 1 },
                    { label: (root._showItems ? "Hide" : "Show"), icon: "", opacity: 1 },
                    { label: "", icon: "\ue928", opacity: (root._showItems ? 1 : 0) },
                    { label: "Blue", icon: "", opacity: (root._showItems ? 1 : 0) },
                    { label: "", icon: "\ue929", opacity: (root._showItems ? 1 : 0) },
                    { label: "Yellow", icon: "", opacity: (root._showItems ? 1 : 0) }
                ]
                onClicked: function (index) {
                    toolbar.currentIndex = index;
                    switch (index) {
                    case 0:
                        root._horizontalToolbar = !root._horizontalToolbar;
                        break;
                    case 1:
                        root._showItems = !root._showItems;
                        break;
                    case 2:
                        root._currentColor = "white";
                        root._icon = "\ue928";
                        icon.color = "yellow";
                        break;
                    case 3:
                        root._currentColor = "blue";
                        root._icon = "";
                        break;
                    case 4:
                        root._currentColor = "white";
                        root._icon = "\ue929";
                        icon.color = "blue";
                        break;
                    case 5:
                        root._currentColor = "yellow";
                        root._icon = "";
                        break;
                    }
                }
            }

            Rectangle {
                id: payload
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

                RowLayout {
                    id: row
                    //width: parent.width // uncomment if you want the layout to take advantage of the full width
                    height: 100
                    anchors.bottom: parent.bottom
                    spacing: 10

                    Repeater {
                        id: repeat
                        model: 5
                        delegate: Rectangle {
                            id: del
                            color: "white"
                            border {
                                width: 2
                                color: "black"
                            }
                            Layout.fillHeight: true
                            Layout.preferredWidth: 50 + 10 * Math.random()

                            Text {
                                font {
                                    pixelSize: 18
                                }
                                text: Math.floor(del.width)
                                color: "black"
                                anchors.centerIn: parent
                            }
                        }
                    }
                }
            }
        }
    }
}
