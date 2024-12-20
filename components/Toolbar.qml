pragma ComponentBehavior: Bound
import QtQuick

Item {
    id: root

    property var buttons
    property bool isHorizontal: true
    property alias currentIndex: list.currentIndex

    signal clicked(int index)

    implicitHeight: list.implicitHeight
    implicitWidth: list.implicitWidth

    ListView {
        id: list
        orientation: root.isHorizontal ? ListView.Horizontal : ListView.Vertical
        model: root.buttons
        spacing: 10
        implicitWidth: contentItem.childrenRect.width * (root.isHorizontal ? count : 1)
        implicitHeight: contentItem.childrenRect.height * (root.isHorizontal ? 1 : count)
        clip: true
        interactive: root.isHorizontal ? contentWidth > width : contentHeight > height
        delegate: Button {
            id: del
            required property int index
            required property var modelData
            isStrong: del.index === list.currentIndex
            label: modelData.label
            icon: modelData.icon
            opacity: modelData.opacity
            onClicked: root.clicked(del.index)
        }
    }
}
