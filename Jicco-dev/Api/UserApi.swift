//
//  UserApi.swift
//  Jicco-dev
//
//  Created by 小康 on 2022/12/3.
//

import Foundation
import GRPC
import SwiftProtobuf

let host = "139.224.187.162"
//let host = "127.0.0.1"
let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
let channel = try? GRPCChannelPool.with(target: .hostAndPort(host, 9000),
                                        transportSecurity: .plaintext,
                                        eventLoopGroup: group)
let userClient = Api_User_V1_UserAsyncClient(channel: channel!)

enum UserApi {}

extension UserApi {
    public static var user: UserResource {
        UserResource()
    }
    
    public struct UserResource {
        // 列表
        public func list(username: String) async -> Api_User_V1_ListUserReply {
            let req = Api_User_V1_ListUserReq.with {
                $0.page = 1
                $0.pageSize = 1000
                $0.username = username
            }
            let call = userClient.makeListUserCall(req)
            do {
                return try await call.response
            } catch {
                let status = await call.status
                print("调用失败: \(status)")
            }
            return Api_User_V1_ListUserReply()
        }
        
        // 获取详情
        public func getInfo(id: Int64) async -> Api_User_V1_UserReply {
            let req = Google_Protobuf_Int64Value(id)
            let call = userClient.makeGetUserCall(req)
            do {
                return try await call.response
            } catch {
                let status = await call.status
                print("调用失败: \(status)")
            }
            return Api_User_V1_UserReply()
        }
        
        // 获取名称
        public func getName(id: Int64) async -> String {
            let req = Google_Protobuf_Int64Value(id)
            let call = userClient.makeGetUserNameCall(req)
            do {
                return try await call.response.value
            } catch {
                let status = await call.status
                let result = handleStatus(status)
                print("调用失败, code=\(result.code), message=\(result.message)")
                return result.message
                
            }
//            return ""
        }
        
        // 新增
        public func save(username: String, password: String) async {
            let req = Api_User_V1_SaveUserReq.with {
                $0.username = username
                $0.password = password
            }
            let call = userClient.makeSaveUserCall(req)
            do {
                _ = try await call.response
            } catch {
                print(error)
            }
        }
        
        // 更新
        public func update(id: Int64, username: String, password: String) async {
            let req = Api_User_V1_UpdateUserReq.with {
                $0.id = id
                $0.username = username
                $0.password = password
            }
            let call = userClient.makeUpdateUserCall(req)
            do {
                _ = try await call.response
            } catch {
                print(error)
            }
        }
        
        // 删除
        public func delete(id: Int64) async {
            let req = Google_Protobuf_Int64Value(id)
            do {
                _ = try await userClient.deleteUser(req)
            } catch {
                print(error)
            }
        }
    }
}

func handleStatus(_ status: GRPCStatus) -> (code: String, message: String) {
    if status.message != nil {
        let arr: [Substring] = status.message!.split(separator: "|")
        return (String(arr[0]), String(arr[1]))
    }
    return ("", "")
}
