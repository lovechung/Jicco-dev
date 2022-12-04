//
//  UserList.swift
//  Jicco-dev
//
//  Created by 小康 on 2022/12/3.
//

import SwiftUI

struct UserList: View {
    @EnvironmentObject var userData: UserData
    @State var username: String = ""
    @State var isInfoPresented: Bool = false
    @State var isEditPresented: Bool = false
    @State var isError: Bool = false
    @State var errorMsg: String = ""
    @State var isEdit: Bool = false
    @State var editId: Int64 = 0
    @State var editUsername: String = ""
    @State var editPassword: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack() {
                Text("用户名：")
                    .padding()
                
                TextField("请输入用户名", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 20)
            }
            
            Button {
                list(username)
            } label: {
                Text("查询")
                    .font(.system(size: 15))
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 3)
                    .padding()
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
            }

            Button {
                editUsername = ""
                editPassword = ""
                isEdit = false
                self.isEditPresented.toggle()
            } label: {
                Text("新增")
                    .font(.system(size: 15))
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 3)
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
            }
            
            List {
                Section(header: Text("用户列表")) {
                    ForEach(userData.list, id: \.id) { item in
                        HStack {
                            Text(String(item.id) + " - " + item.username)
                            Spacer()
                            Text(item.createdAt)
                        }
                        .padding(5)
                        .onTapGesture(count: 1) {
                            getInfo(item.id)
                            self.isInfoPresented.toggle()
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                isEdit = true
                                editId = item.id
                                editUsername = item.username
                                editPassword = item.password
                                self.isEditPresented.toggle()
                            } label: {
                                Label("Update", systemImage: "square.and.pencil")
                            }
                            .tint(.yellow)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                delete(item.id)
                                list(username)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .onAppear {
                UITableView.appearance().showsVerticalScrollIndicator = false
            }
            .task {
                list(username)
            }
            .refreshable {
                list(username)
            }
        }
        .sheet(isPresented: $isEditPresented) {
            if #available(iOS 16.0, *) {
                Form {
                    Section {
                        TextField("用户名", text: $editUsername)
                        SecureField("密码", text: $editPassword)
                    }

                    Button(action: {
                        if isEdit {
                            update(editId, editUsername, editPassword)
                        } else {
                            save(editUsername, editPassword)
                        }
                        list(username)
                        self.isEditPresented.toggle()
                    }, label: {
                        Text("保存")
                            .foregroundColor(.blue)
                    })
                }
                .presentationDetents([.medium, .large, .fraction(0.5)])
            }
        }
        .alert(isPresented: self.$isInfoPresented) {
            Alert(title: Text(isError ? "⚠️" : "用户信息"),
                  message: Text(isError ? errorMsg
                                : userData.user.username + " <"
                                + userData.user.password + ">\n"
                                + userData.user.createdAt))
        }
    }
    
    func list(_ username: String) {
        Task {
            await userData.list(username)
        }
    }

    func getInfo(_ id: Int64) {
        Task {
            await userData.getInfo(id)
        }
    }

//    func getName(_ id: Int64) {
//        Task {
//            await userData.getName(id)
//        }
//    }

    func save(_ username: String, _ password: String) {
        Task {
            await userData.save(username, password)
        }
    }

    func update(_ id: Int64, _ username: String, _ password: String) {
        Task {
            await userData.update(id, username, password)
        }
    }

    func delete(_ id: Int64) {
        Task {
            await userData.delete(_:)(id)
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList().environmentObject(UserData())
    }
}
