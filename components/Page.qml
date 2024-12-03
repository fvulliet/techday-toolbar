import QtQuick

Item {
    id: root

    property alias borderColor: outer.color
    property alias backgroundColor: frame.color
    property alias screenColor: inner.color
    property alias cornerRadius: outer.radius

    readonly property int _borderWidth: 8
    readonly property int _frameWidth: 40

    Rectangle {
        id: outer
        color: "black"
        radius: 8
        anchors.fill: parent

        Rectangle {
            id: frame
            radius: outer.radius
            color: "white"
            anchors {
                fill: parent
                margins: root._borderWidth
            }

            Rectangle {
                id: inner
                color: "gray"
                anchors {
                    fill: parent
                    topMargin: root._frameWidth
                    leftMargin: root._frameWidth
                    rightMargin: root._frameWidth
                    bottomMargin: 4*root._frameWidth
                }
            }
        }
    }
}
