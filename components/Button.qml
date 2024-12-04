import QtQuick

Item {
    id: root

    property alias color: payload.color
    property bool isStrong: true
    property string label
    property int padding: 20
    property string icon

    property bool _isIcon: icon.length > 0

    signal clicked()

    implicitWidth: payload.implicitWidth
    implicitHeight: payload.implicitHeight

    Rectangle {
        id: payload
        implicitWidth: root._isIcon ? myIcon.implicitWidth + root.padding : myLabel.implicitWidth + root.padding
        implicitHeight: root._isIcon ? myIcon.implicitHeight + root.padding : myLabel.implicitHeight + root.padding
        color: root.isStrong ? "black" : "white"
        border {
            width: 2
            color: root.isStrong ? "white" : "black"
        }
        radius: 5
        anchors.centerIn: parent

        Text {
            id: myLabel
            font {
                pixelSize: 32
                family: "reMarkableSans-Regular"
            }
            text: root.label
            color: root.isStrong ? "white" : "black"
            anchors.centerIn: parent
            visible: root.label.length > 0
        }

        Text {
            id: myIcon
            font {
                pixelSize: 32
                family: "icomoon"
            }
            text: root.icon
            color: root.isStrong ? "white" : "black"
            anchors.centerIn: parent
            visible: root.icon.length > 0
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked();
    }
}
