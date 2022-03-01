//
//  NetworkManager.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import Foundation
import Get

// 基础url
let BaseURL = "app.api.test.jiccos.com"
//let BaseURL = "www.fastmock.site"

// 请求成功回调
typealias SuccessCallback<T: Decodable> = ((T) -> Void)
// 请求回调
typealias FailureCallback<T: Decodable> = (Res<T>) -> Void

// 构造请求客户端
let client = APIClient(host: BaseURL) {
    $0.delegate = JiccoAPIClientDelegate()
}

private final class JiccoAPIClientDelegate: APIClientDelegate {
    func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws {
        request.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    }
}

// 发送网络请求
@discardableResult
func request<T: Decodable>(_ target: Request<Res<T>>,
                           _ showFailAlert: Bool = true,
                           _ failure: FailureCallback<T>? = nil) async -> T {
    return await Task { () -> T in
        var data: T?
        do {
            let response: Res<T> = try await client.send(target).value
            data = response.data
            if response.code != "00000" {
                if showFailAlert {
                    print("弹出框显示错误信息: \(response.message)")
                }
                failure?(response)
            }
        } catch {
            print("网络请求失败", error)
        }
        return data!
    }.value
}

// 响应体
struct Res<T: Decodable>: Decodable {
    let code: String
    let message: String
    let data: T
    let timestamp: String
}

var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjM3OTExMjYyNzksInVzZXJfaWQiOjUzLCJpYXQiOjE2NDM2NDI2MzIsImp0aSI6IjVjMmQ1Yzc3LTFmMjAtNGEzNy05N2U5LTIzNjM3ZTAyZTU1ZSJ9.excMzpmXXoTJB4J6fzdVeSWJ6F9jtcqW0FFfxiHJI6eWD6H51wBv-H8CUiCrrZrB8QjR9F1TK589btx4qhrL0wTG6l-ehN7yHOBGK9rAvtoy8RIMu8TjU4wxP7sHUygFL8NE4z80aj6PiMWVRgBb97AHNEmi-3gOiks0iU4MZj6LmqvzCoveD1-9C5phm9rLQKJg7GM1BIu_j5g7aGa3gKe3mjfzrddc3kkzLDfmwy7DKpRRQFkjKcIPEj1sN31tg62zI1TP5FHK_3rwzfvOfTovSRTFnh0niibpJSClesVvAH7pGZDwODCmiZK1mCwl5OnzlBUluEFM_pRkrXYOAw"
