//
//  ListView.swift
//  HelloWorld
//
//  Created by Yogesh Bhawsar on 22/01/23.
//

import SwiftUI

struct User: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

struct ListView: View {
    @State private var name: String = ""
    @State private var users = [User]()

    func addItem(){
        if name.count > 1 {
            users.append(User(name: name))
        }
        name = ""
    }

    @State private var multiSelection = Set<UUID>()

    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Spacer()
                    TextField("Enter your name", text: $name) .onSubmit{
                        addItem()
                    } .autocorrectionDisabled(true)
                    Spacer()
                    Button(action: addItem) {
                        Image(systemName: "plus")
                    }
                    Spacer()
                } .padding(12)

                if users.count == 0 {
                    Text ("Add User first")
                        .padding(16)
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                }
                List {
                    ForEach(users, id: \.self) { user in
                        NavigationLink(destination: {
                            Text(user.name)
                                .navigationTitle(user.name)
                        }) {
                            Text(user.name).font(.system(size: 20, weight: .semibold, design: .rounded))
                                
                            
                        }
                    }
                    .onDelete { users.remove(atOffsets: $0) }
                    .onMove { users.move(fromOffsets: $0, toOffset: $1) }
                }
                .navigationTitle("Users")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
            }
        }

    }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }

}
