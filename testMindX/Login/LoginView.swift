//
//  LoginView.swift
//  testMindX
//
//  Created by VinhLN on 13/10/2022.
//

import SwiftUI

struct LoginView: View {
	private var image: String
	private var title: String
	private var placeholder: String
	@State private var textField: String

	// MARK: - Init

	public init(image: String, title: String, placeholder: String, textField: String) {
		self.image = image
		self.title = title
		self.placeholder = placeholder
		self.textField = textField
	}

	// MARK: - Body
    var body: some View {
		HStack {
			
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
