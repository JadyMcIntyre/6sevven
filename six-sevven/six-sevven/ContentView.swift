import SwiftUI
import Cocoa

struct ContentView: View {
    // Define your custom keyboard layout
    let keys: [[String]] = [
        // Replace these arrays with the actual keys from your 67-key keyboard
        ["Esc", "1  !", "2  @", "3  #", "4  $", "5  %", "6  ^", "7  &", "8  *", "9  (", "0  )", "- -", "= +", "<---", "Del"],
        ["Tab", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "[  {", "]  }", "\\  |", "` ~"],
        ["CapsLk", "A", "S", "D", "F", "G", "H", "J", "K", "L", "; :", "' \"", "Enter", "PgUp"],
        ["Shift", "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/", "LShift", "↑","PgDn"],
        ["Ctrl", "Win", "Cmd", "Space", "Alt", "Fn","RC","←","↓","→"]
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(keys, id: \.self) { row in
                HStack(spacing: 4) {
                    ForEach(row, id: \.self) { key in
                        KeyView(key: key)
                    }
                }
            }
        }
        .padding()
        .background(Color.clear)
    }

}

struct KeyView: View {
    let key: String

    var body: some View {
        Text(key)
            .font(.system(size: 14))
            .foregroundColor(Color.gray)
            .frame(width: keyWidth(key: key), height: 40)
            .background(Color.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 1)
            )
    }

    func keyWidth(key: String) -> CGFloat {
        switch key {
        case "Space":
            return 250
        case "Shift", "Enter":
            return 85
        case "LShift", "CapsLk", "<---":
            return 60
        case "Tab", "\\  |":
            return 50
        case "Cmd", "Ctrl", "Win":
            return 50
        default:
            return 40
        }
    }
}
