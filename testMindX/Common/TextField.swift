//
//  TextField.swift
//  testMindX
//
//  Created by VinhLN on 17/10/2022.
//

import SwiftUI

public struct TextFieldCommon: View {
    private var image: String
    private var warning: String
    private var placeholder: String
    @Binding var text: String
//    @Binding var inputStyle: TextInputStyle

    // MARK: - Init
    public init(image: String, warning: String, placeholder: String, text: Binding<String>) {
        self.image = image
        self.warning = warning
        self.placeholder = placeholder
        self._text = text
//        self._inputStyle = inputStyle
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .center) {
                Image(image)
                    .padding(.leading, 5)
                TextField(placeholder, text: $text)
                    .foregroundColor(Color.black.opacity(0.6))
                    .font(.system(size: 13))
            }
            .frame(height: 35)
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5)))
            .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
            
//            if needShowNotifiyMessage {
//                Text(notifyMessage)
//                    .foregroundColor(Color.red)
//                    .font(.system(size: 12))
//            }
        }
    }
}

struct TextFieldCommon_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldCommon(image: "ic_mail", warning: "Error", placeholder: "Username", text: .constant("Test"))
    }
}

//extension TextFieldCommon {
//    var needShowNotifiyMessage: Bool {
//            switch inputStyle {
//            case .error, .success: return true
//            }
//        }
//
//    var notifyMessage: String {
//        switch inputStyle {
//        case .error(let message), .success(let message): return message
//        }
//    }
//}
