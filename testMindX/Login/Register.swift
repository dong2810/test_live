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
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isNext: Bool = false
    @Binding var emailStyle: TextInputStyle
    
    @ObservedResults(UserModel.self) var userList
    
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
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(emailStyle: .constant(.error(message: "Test")))
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
            TextFieldCommon(image: "ic_user", warning: "", placeholder: "Username", text: $username, inputStyle: $emailStyle)
            TextFieldCommon(image: "ic_mail", warning: "", placeholder: "Email", text: $email, inputStyle: $emailStyle)
            SecureFieldCommon(image: "ic_lock", title: "", placeholder: "Password", text: $password)
            SecureFieldCommon(image: "ic_lock", title: "", placeholder: "Confirm Password", text: $password)
            
            ForEach(userList, id: \.id) { item in
                Text(item.username)
            }
        }
    }
    
    var signUpButton: some View {
        NavigationLink(destination: LoginView(emailStyle: $emailStyle), isActive: $isNext) {
            Button {
                let userList = UserModel()
                userList.username = username
                userList.email = email
                userList.password = password
                $userLists.append(userList)
                
                isNext.toggle()
            } label: {
                Text("SIGN UP")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Color.black)
            .cornerRadius(5)
        }
    }
    
    func checkValid() {
        
    }
}
