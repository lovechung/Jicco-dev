//
//  UserData.swift
//  Jicco-dev
//
//  Created by 小康 on 2022/12/3.
//

import Foundation

@MainActor
class UserData: ObservableObject {
    
    @Published var list = [Api_User_V1_UserReply]()
    @Published var user = Api_User_V1_UserReply()
    @Published var username = ""
    
    func list(_ username: String) async {
        let data = await UserApi.user.list(username: username)
        list = data.list
    }
    
    func getInfo(_ id: Int64) async {
        user = await UserApi.user.getInfo(id: id)
    }
    
    func save(_ username: String, _ password: String) async {
        await UserApi.user.save(username: username, password: password)
    }
    
    func update(_ id: Int64, _ username: String, _ password: String) async {
        await UserApi.user.update(id: id, username: username, password: password)
    }
    
    func getName(_ id: Int64) async {
        username = await UserApi.user.getName(id: id)
    }
    
    func delete(_ id: Int64) async {
        await UserApi.user.delete(id: id)
    }
}
