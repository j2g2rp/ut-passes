import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
   id: fields
   property string passId
   property string style: "generic"
   property string thumbnail: ""
   property var primaryFields: []
   property color foregroundColor
   property color labelColor

   height: f.height

   Column {
      id: f
      anchors.left: parent.left
      width: parent.width / 2
      height: childrenRect.height

      Text {
         width: parent.width
         visible: fields.primaryFields.length
         text: (fields.primaryFields.length && primaryFields[0].label || "").toUpperCase()
         wrapMode: Text.WordWrap
         font.pointSize: units.gu(1)
         color: labelColor
      }

      Text {
         width: parent.width
         visible: fields.primaryFields.length
         text: fields.primaryFields.length && primaryFields[0].value || ""
         wrapMode: Text.WordWrap
         font.pointSize: units.gu(2)
         color: foregroundColor
      }
   }

   Image {
      id: airplaneImage
      anchors.centerIn: parent
      width: units.gu(5)
      height: units.gu(5)
      source: "qrc:///airplane-flying.png"
      visible: fields.style === "boardingPass"
   }

   ColorOverlay {
       anchors.fill: airplaneImage
       source: airplaneImage
       color: fields.foregroundColor
       visible: fields.style === "boardingPass"
   }

   Image {
      anchors.right: parent.right
      width: Math.max(f.height, units.gu(5))
      height: Math.max(f.height, units.gu(5))
      source: "image://passes/" + passId + "/thumbnail"
      visible: fields.style !== "boardingPass" && fields.primaryFields.length < 2
   }

   Column {
      anchors.right: parent.right
      width: childrenRect.width //parent.width / 2
      height: childrenRect.height

      Text {
         visible: fields.primaryFields.length >= 2
         text: (fields.primaryFields.length >= 2 && primaryFields[1].label || "").toUpperCase()
         wrapMode: Text.WordWrap
         font.pointSize: units.gu(1)
         color: labelColor
      }

      Text {
         visible: fields.primaryFields.length >= 2
         text: fields.primaryFields.length >= 2 && primaryFields[1].value || ""
         wrapMode: Text.WordWrap
         font.pointSize: units.gu(2)
         color: foregroundColor
      }
   }
}
