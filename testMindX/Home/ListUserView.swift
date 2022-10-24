//
//  ListUserView.swift
//  testMindX
//
//  Created by VinhLN on 19/10/2022.
//

import SwiftUI
import RealmSwift

struct ListUserView: View {
    @ObservedResults(UserModel.self) var userLists
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            if userLists.isEmpty {
                Text("No user lists!")
            }
            
            List {
                ForEach(userLists, id: \.id) { userList in
                    Text(userList.username)
                }.onDelete(perform: $userLists.remove)
            }
        }
    }
}

struct ListUserView_Previews: PreviewProvider {
    static var previews: some View {
        ListUserView()
    }
}
