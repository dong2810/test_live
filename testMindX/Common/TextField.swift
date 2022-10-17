//
//  TextField.swift
//  testMindX
//
//  Created by VinhLN on 17/10/2022.
//

import SwiftUI

public struct TextFieldCommon: View {
    private var image: String
    private var title: String
    private var placeholder: String
    @Binding var text: String

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
            TextField(placeholder, text: $text)
                .foregroundColor(Color.black.opacity(0.6))
                .font(.system(size: 13))
        }
        .frame(height: 35)
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5)))
        .shadow(color: Color.gray, radius: 1, x: 1, y: 1)
    }
}

struct TextFieldCommon_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldCommon(image: "ic_mail", title: "", placeholder: "Username", text: .constant("Test"))
    }
}
