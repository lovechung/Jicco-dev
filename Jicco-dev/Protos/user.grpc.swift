//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: user.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


///*
/// 用户
///
/// Usage: instantiate `Api_User_V1_UserClient`, then call methods of this protocol to make API calls.
internal protocol Api_User_V1_UserClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Api_User_V1_UserClientInterceptorFactoryProtocol? { get }

  func listUser(
    _ request: Api_User_V1_ListUserReq,
    callOptions: CallOptions?
  ) -> UnaryCall<Api_User_V1_ListUserReq, Api_User_V1_ListUserReply>

  func getUser(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions?
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, Api_User_V1_UserReply>

  func getUserName(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions?
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, SwiftProtobuf.Google_Protobuf_StringValue>

  func getUserNameMap(
    _ request: Api_User_V1_UserIdsReq,
    callOptions: CallOptions?
  ) -> UnaryCall<Api_User_V1_UserIdsReq, Api_User_V1_UserNameMapReply>

  func saveUser(
    _ request: Api_User_V1_SaveUserReq,
    callOptions: CallOptions?
  ) -> UnaryCall<Api_User_V1_SaveUserReq, SwiftProtobuf.Google_Protobuf_Empty>

  func updateUser(
    _ request: Api_User_V1_UpdateUserReq,
    callOptions: CallOptions?
  ) -> UnaryCall<Api_User_V1_UpdateUserReq, SwiftProtobuf.Google_Protobuf_Empty>

  func updateUserStatus(
    _ request: Api_User_V1_UpdateUserStatusReq,
    callOptions: CallOptions?
  ) -> UnaryCall<Api_User_V1_UpdateUserStatusReq, SwiftProtobuf.Google_Protobuf_Empty>

  func deleteUser(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions?
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, SwiftProtobuf.Google_Protobuf_Empty>
}

extension Api_User_V1_UserClientProtocol {
  internal var serviceName: String {
    return "api.user.v1.User"
  }

  /// 分页获取用户列表
  ///
  /// - Parameters:
  ///   - request: Request to send to ListUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func listUser(
    _ request: Api_User_V1_ListUserReq,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Api_User_V1_ListUserReq, Api_User_V1_ListUserReply> {
    return self.makeUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.listUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeListUserInterceptors() ?? []
    )
  }

  /// 获取用户详情
  ///
  /// - Parameters:
  ///   - request: Request to send to GetUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getUser(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, Api_User_V1_UserReply> {
    return self.makeUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.getUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserInterceptors() ?? []
    )
  }

  /// 获取用户昵称
  ///
  /// - Parameters:
  ///   - request: Request to send to GetUserName.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getUserName(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, SwiftProtobuf.Google_Protobuf_StringValue> {
    return self.makeUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.getUserName.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserNameInterceptors() ?? []
    )
  }

  /// 获取用户昵称（批量）
  ///
  /// - Parameters:
  ///   - request: Request to send to GetUserNameMap.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getUserNameMap(
    _ request: Api_User_V1_UserIdsReq,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Api_User_V1_UserIdsReq, Api_User_V1_UserNameMapReply> {
    return self.makeUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.getUserNameMap.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserNameMapInterceptors() ?? []
    )
  }

  /// 保存用户
  ///
  /// - Parameters:
  ///   - request: Request to send to SaveUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func saveUser(
    _ request: Api_User_V1_SaveUserReq,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Api_User_V1_SaveUserReq, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.saveUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSaveUserInterceptors() ?? []
    )
  }

  /// 更新用户
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateUser(
    _ request: Api_User_V1_UpdateUserReq,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Api_User_V1_UpdateUserReq, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.updateUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? []
    )
  }

  /// 更新用户状态
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateUserStatus.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateUserStatus(
    _ request: Api_User_V1_UpdateUserStatusReq,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Api_User_V1_UpdateUserStatusReq, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.updateUserStatus.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserStatusInterceptors() ?? []
    )
  }

  /// 删除用户
  ///
  /// - Parameters:
  ///   - request: Request to send to DeleteUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deleteUser(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.deleteUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? []
    )
  }
}

#if compiler(>=5.6)
@available(*, deprecated)
extension Api_User_V1_UserClient: @unchecked Sendable {}
#endif // compiler(>=5.6)

@available(*, deprecated, renamed: "Api_User_V1_UserNIOClient")
internal final class Api_User_V1_UserClient: Api_User_V1_UserClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Api_User_V1_UserClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Api_User_V1_UserClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the api.user.v1.User service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Api_User_V1_UserClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Api_User_V1_UserNIOClient: Api_User_V1_UserClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Api_User_V1_UserClientInterceptorFactoryProtocol?

  /// Creates a client for the api.user.v1.User service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Api_User_V1_UserClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

#if compiler(>=5.6)
///*
/// 用户
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Api_User_V1_UserAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Api_User_V1_UserClientInterceptorFactoryProtocol? { get }

  func makeListUserCall(
    _ request: Api_User_V1_ListUserReq,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Api_User_V1_ListUserReq, Api_User_V1_ListUserReply>

  func makeGetUserCall(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, Api_User_V1_UserReply>

  func makeGetUserNameCall(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, SwiftProtobuf.Google_Protobuf_StringValue>

  func makeGetUserNameMapCall(
    _ request: Api_User_V1_UserIdsReq,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Api_User_V1_UserIdsReq, Api_User_V1_UserNameMapReply>

  func makeSaveUserCall(
    _ request: Api_User_V1_SaveUserReq,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Api_User_V1_SaveUserReq, SwiftProtobuf.Google_Protobuf_Empty>

  func makeUpdateUserCall(
    _ request: Api_User_V1_UpdateUserReq,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Api_User_V1_UpdateUserReq, SwiftProtobuf.Google_Protobuf_Empty>

  func makeUpdateUserStatusCall(
    _ request: Api_User_V1_UpdateUserStatusReq,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Api_User_V1_UpdateUserStatusReq, SwiftProtobuf.Google_Protobuf_Empty>

  func makeDeleteUserCall(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, SwiftProtobuf.Google_Protobuf_Empty>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Api_User_V1_UserAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Api_User_V1_UserClientMetadata.serviceDescriptor
  }

  internal var interceptors: Api_User_V1_UserClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeListUserCall(
    _ request: Api_User_V1_ListUserReq,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Api_User_V1_ListUserReq, Api_User_V1_ListUserReply> {
    return self.makeAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.listUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeListUserInterceptors() ?? []
    )
  }

  internal func makeGetUserCall(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, Api_User_V1_UserReply> {
    return self.makeAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.getUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserInterceptors() ?? []
    )
  }

  internal func makeGetUserNameCall(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, SwiftProtobuf.Google_Protobuf_StringValue> {
    return self.makeAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.getUserName.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserNameInterceptors() ?? []
    )
  }

  internal func makeGetUserNameMapCall(
    _ request: Api_User_V1_UserIdsReq,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Api_User_V1_UserIdsReq, Api_User_V1_UserNameMapReply> {
    return self.makeAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.getUserNameMap.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserNameMapInterceptors() ?? []
    )
  }

  internal func makeSaveUserCall(
    _ request: Api_User_V1_SaveUserReq,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Api_User_V1_SaveUserReq, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.saveUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSaveUserInterceptors() ?? []
    )
  }

  internal func makeUpdateUserCall(
    _ request: Api_User_V1_UpdateUserReq,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Api_User_V1_UpdateUserReq, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.updateUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? []
    )
  }

  internal func makeUpdateUserStatusCall(
    _ request: Api_User_V1_UpdateUserStatusReq,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Api_User_V1_UpdateUserStatusReq, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.updateUserStatus.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserStatusInterceptors() ?? []
    )
  }

  internal func makeDeleteUserCall(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<SwiftProtobuf.Google_Protobuf_Int64Value, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.deleteUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Api_User_V1_UserAsyncClientProtocol {
  internal func listUser(
    _ request: Api_User_V1_ListUserReq,
    callOptions: CallOptions? = nil
  ) async throws -> Api_User_V1_ListUserReply {
    return try await self.performAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.listUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeListUserInterceptors() ?? []
    )
  }

  internal func getUser(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions? = nil
  ) async throws -> Api_User_V1_UserReply {
    return try await self.performAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.getUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserInterceptors() ?? []
    )
  }

  internal func getUserName(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions? = nil
  ) async throws -> SwiftProtobuf.Google_Protobuf_StringValue {
    return try await self.performAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.getUserName.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserNameInterceptors() ?? []
    )
  }

  internal func getUserNameMap(
    _ request: Api_User_V1_UserIdsReq,
    callOptions: CallOptions? = nil
  ) async throws -> Api_User_V1_UserNameMapReply {
    return try await self.performAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.getUserNameMap.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserNameMapInterceptors() ?? []
    )
  }

  internal func saveUser(
    _ request: Api_User_V1_SaveUserReq,
    callOptions: CallOptions? = nil
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try await self.performAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.saveUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSaveUserInterceptors() ?? []
    )
  }

  internal func updateUser(
    _ request: Api_User_V1_UpdateUserReq,
    callOptions: CallOptions? = nil
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try await self.performAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.updateUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? []
    )
  }

  internal func updateUserStatus(
    _ request: Api_User_V1_UpdateUserStatusReq,
    callOptions: CallOptions? = nil
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try await self.performAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.updateUserStatus.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserStatusInterceptors() ?? []
    )
  }

  internal func deleteUser(
    _ request: SwiftProtobuf.Google_Protobuf_Int64Value,
    callOptions: CallOptions? = nil
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try await self.performAsyncUnaryCall(
      path: Api_User_V1_UserClientMetadata.Methods.deleteUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Api_User_V1_UserAsyncClient: Api_User_V1_UserAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Api_User_V1_UserClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Api_User_V1_UserClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

#endif // compiler(>=5.6)

internal protocol Api_User_V1_UserClientInterceptorFactoryProtocol: GRPCSendable {

  /// - Returns: Interceptors to use when invoking 'listUser'.
  func makeListUserInterceptors() -> [ClientInterceptor<Api_User_V1_ListUserReq, Api_User_V1_ListUserReply>]

  /// - Returns: Interceptors to use when invoking 'getUser'.
  func makeGetUserInterceptors() -> [ClientInterceptor<SwiftProtobuf.Google_Protobuf_Int64Value, Api_User_V1_UserReply>]

  /// - Returns: Interceptors to use when invoking 'getUserName'.
  func makeGetUserNameInterceptors() -> [ClientInterceptor<SwiftProtobuf.Google_Protobuf_Int64Value, SwiftProtobuf.Google_Protobuf_StringValue>]

  /// - Returns: Interceptors to use when invoking 'getUserNameMap'.
  func makeGetUserNameMapInterceptors() -> [ClientInterceptor<Api_User_V1_UserIdsReq, Api_User_V1_UserNameMapReply>]

  /// - Returns: Interceptors to use when invoking 'saveUser'.
  func makeSaveUserInterceptors() -> [ClientInterceptor<Api_User_V1_SaveUserReq, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when invoking 'updateUser'.
  func makeUpdateUserInterceptors() -> [ClientInterceptor<Api_User_V1_UpdateUserReq, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when invoking 'updateUserStatus'.
  func makeUpdateUserStatusInterceptors() -> [ClientInterceptor<Api_User_V1_UpdateUserStatusReq, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when invoking 'deleteUser'.
  func makeDeleteUserInterceptors() -> [ClientInterceptor<SwiftProtobuf.Google_Protobuf_Int64Value, SwiftProtobuf.Google_Protobuf_Empty>]
}

internal enum Api_User_V1_UserClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "User",
    fullName: "api.user.v1.User",
    methods: [
      Api_User_V1_UserClientMetadata.Methods.listUser,
      Api_User_V1_UserClientMetadata.Methods.getUser,
      Api_User_V1_UserClientMetadata.Methods.getUserName,
      Api_User_V1_UserClientMetadata.Methods.getUserNameMap,
      Api_User_V1_UserClientMetadata.Methods.saveUser,
      Api_User_V1_UserClientMetadata.Methods.updateUser,
      Api_User_V1_UserClientMetadata.Methods.updateUserStatus,
      Api_User_V1_UserClientMetadata.Methods.deleteUser,
    ]
  )

  internal enum Methods {
    internal static let listUser = GRPCMethodDescriptor(
      name: "ListUser",
      path: "/api.user.v1.User/ListUser",
      type: GRPCCallType.unary
    )

    internal static let getUser = GRPCMethodDescriptor(
      name: "GetUser",
      path: "/api.user.v1.User/GetUser",
      type: GRPCCallType.unary
    )

    internal static let getUserName = GRPCMethodDescriptor(
      name: "GetUserName",
      path: "/api.user.v1.User/GetUserName",
      type: GRPCCallType.unary
    )

    internal static let getUserNameMap = GRPCMethodDescriptor(
      name: "GetUserNameMap",
      path: "/api.user.v1.User/GetUserNameMap",
      type: GRPCCallType.unary
    )

    internal static let saveUser = GRPCMethodDescriptor(
      name: "SaveUser",
      path: "/api.user.v1.User/SaveUser",
      type: GRPCCallType.unary
    )

    internal static let updateUser = GRPCMethodDescriptor(
      name: "UpdateUser",
      path: "/api.user.v1.User/UpdateUser",
      type: GRPCCallType.unary
    )

    internal static let updateUserStatus = GRPCMethodDescriptor(
      name: "UpdateUserStatus",
      path: "/api.user.v1.User/UpdateUserStatus",
      type: GRPCCallType.unary
    )

    internal static let deleteUser = GRPCMethodDescriptor(
      name: "DeleteUser",
      path: "/api.user.v1.User/DeleteUser",
      type: GRPCCallType.unary
    )
  }
}

