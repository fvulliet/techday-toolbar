import QtQuick
import "./components" as Components

Window {
    width: 800
    height: 1280
    visible: true
    title: qsTr("techDay Toolbar")

    FontLoader {
        id: icomoonFont
        source: "qrc:/fonts/icomoon.ttf"
    }

    Components.Page {
        id: page
        anchors {
            fill: parent
            margins: 42
        }
        borderColor: "#5e5e5e"
        backgroundColor: "#e4e4e4"
        screenColor: "#d4d4d4"
        cornerRadius: 24
    }

    Components.Button {
        anchors.centerIn: page
        isStrong: false
        label: "Hello"
    }
}
