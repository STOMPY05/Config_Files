import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: passwordField
    focus: true
    selectByMouse: true
    placeholderText: config.PasswordFieldBgText
    echoMode: TextInput.Password
    passwordCharacter: "•"
    selectionColor: config.TextFieldHighlightColor
    renderType: Text.NativeRendering
    font.family: config.Font
    font.pointSize: config.GeneralFontSize
    font.bold: true
    color: config.TextFieldTextColor
    horizontalAlignment: TextInput.AlignHCenter
    
    background: Rectangle {
        id: passFieldBg
        color: config.TextFieldColor
        border.color: config.TextFieldTextColor
        border.width: 1
        radius: config.CornerRadius
    }

    states: [
        State {
            name: "focused"
            when: passwordField.activeFocus
            
            PropertyChanges {
                target: passFieldBg
                color: Qt.darker(config.TextFieldColor, 1.2)
                border.width: config.TextFieldHighlightWidth
            }
        },
        
        State {
            name: "hovered"
            when: passwordField.hovered
            
            PropertyChanges {
                target: passFieldBg
                color: Qt.darker(config.TextFieldColor, 1.2)
            }
        }
    ]

    transitions: Transition {
        PropertyAnimation {
            properties: "color, border.width"
            duration: 150
        }
    }
}
