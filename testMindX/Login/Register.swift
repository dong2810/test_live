//
//  Register.swift
//  testMindX
//
//  Created by DongNH on 13/10/2022.
//

import SwiftUI
import RealmSwift

struct RegisterView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedResults(UserModel.self) var userLists
    let userList = UserModel()
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
	@State private var showAlert = false
    @State private var isNext: Bool = false
    @State private var isBlank: Bool = false
    @State private var isDuplicate: Bool = false
    @State private var notify: String = ""
    @Binding var emailStyle: TextInputStyle
    
    var body: some View {
        VStack {
            header
                .padding(.top, 90)
            textInput
                .padding(.top, 90)
            signUpButton
                .padding(.top, 50)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 16)
		.alert(isPresented: $showAlert) {
			Alert(title: Text(notify), message: Text(""), dismissButton: .default(Text("OK")))
		}
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
            RegisterView(emailStyle: .constant(.error(message: "")))
    }
}

extension RegisterView {
    var header: some View {
        HStack {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image("ic_chev_left")
            }
            Spacer()
        }
    }
    
    var textInput: some View {
        VStack(alignment: .center, spacing: 10) {
            TextFieldCommon(image: "ic_user", warning: "", placeholder: "Username", text: $username)
            TextFieldCommon(image: "ic_mail", warning: "", placeholder: "Email", text: $email)
            SecureFieldCommon(image: "ic_lock", title: "", placeholder: "Password", text: $password)
            SecureFieldCommon(image: "ic_lock", title: "", placeholder: "Confirm Password", text: $password)
        }
    }
    
    var signUpButton: some View {
        NavigationLink(destination: LoginView(emailStyle: $emailStyle), isActive: $isNext) {
            Button {
                userList.username = username
                userList.email = email
                userList.password = password

				self.isDuplicate = false
//				if let _ = (userLists.first(where: {
//					$0.username == userList.username
//				}) != nil) {
//					self.isDuplicate.toggle()
//					notify = "Username or password has been existed"
//                }

				if (userList.username.contains(username)) {
					self.isDuplicate.toggle()
					notify = "Username or password has been existed"
				} else {
					$userLists.append(userList)
				}
				showAlert.toggle()
//                $userLists.append(userList)
                isNext.toggle()
            } label: {
                Text("SIGN UP")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Color.black)
            .cornerRadius(5)
            .disabled(self.username.isEmpty || self.password.isEmpty)
        }
    }
    
    var checkBlank: Bool {
        username.isEmpty || password.isEmpty == isBlank
    }
}
