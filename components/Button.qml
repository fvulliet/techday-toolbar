import QtQuick

Item {
    id: root

    property alias color: payload.color
    property bool isStrong: true
    property string label
    property int padding: 20

    signal clicked()

    width: payload.implicitWidth
    height: payload.implicitHeight

    Rectangle {
        id: payload
        width: myLabel.implicitWidth + root.padding
        height: myLabel.implicitHeight + root.padding
        color: root.isStrong ? "black" : "white"
        border {
            width: 1
            color: root.isStrong ? "white" : "black"
        }

        Text {
            id: myLabel
            font {
                pixelSize: 24
                family: "reMarkableSans-Regular"
            }
            text: root.label
            color: root.isStrong ? "white" : "black"
            anchors.centerIn: parent
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked();
    }
}
