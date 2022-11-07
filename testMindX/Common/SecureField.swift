//
//  SecureField.swift
//  testMindX
//
//  Created by VinhLN on 17/10/2022.
//

import SwiftUI

public struct SecureFieldCommon: View {
    private var image: String
    private var title: String
    private var placeholder: String
    @Binding var text: String
    @State private var isReveal = false
    
    // MARK: - Init
    public init(image: String, title: String, placeholder: String, text: Binding<String>) {
        self.image = image
        self.title = title
        self.placeholder = placeholder
        self._text = text
    }
    
    // MARK: - Body
    public var body: some View {
        HStack(alignment: .center) {
            Image(image)
                .padding(.leading, 5)
            SecureField(placeholder, text: $text)
                .foregroundColor(Color.black)
                .font(.system(size: 13))
            Button {
                isReveal.toggle()
            } label: {
                secureIcon.foregroundColor(Color.gray.opacity(0.6))
                    .padding(.trailing, 5)
            }

        }
        .frame(height: 35)
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5)))
        .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
    }
}

struct SecureFieldCommon_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldCommon(image: "ic_lock", title: "", placeholder: "Password", text: .constant("Test"))
    }
}

private extension SecureFieldCommon {
    var secureIcon: Image {
        isReveal ? Image("ic_eye_off") : Image("ic_eye_on")
    }
}
