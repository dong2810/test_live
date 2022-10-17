//
//  LoginView.swift
//  testMindX
//
//  Created by VinhLN on 13/10/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isForgot: Bool = false
    
	// MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            header
            inputView
            
        }
        .padding(.horizontal, 16)
    }
}

extension LoginView {
    var header: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Welcome Back !")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color.black)
            Text("Sign in to Continue")
                .font(.system(size: 15))
                .foregroundColor(Color.black)
        }
    }
    
    var inputView: some View {
        VStack(spacing: 5) {
            TextFieldCommon(image: "ic_mail", title: "", placeholder: "Email", text: $email)
            SecureFieldCommon(image: "ic_lock", title: "", placeholder: "Password", text: $password)
            Button {
                isForgot.toggle()
            } label: {
                Text("Forgot password?")
            }

        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
