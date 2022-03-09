//
//  PostApi.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import Foundation
import Get

enum PostApi {}

extension PostApi {
    public static var post: PostResource {
        PostResource()
    }
    
    public struct PostResource {
        public let path: String = "/post"
        
        public func list(_ cursor: Int, _ size: Int) -> Request<Res<PostRes>> {
            let params = [("cursor", String(cursor)), ("size", String(size))]
            return .get(path + "/page/personal", query: params)
        }
        
        public func get(_ id: Int) -> Request<Res<Post>> {
            return .get(path + "/info/\(id)")
        }
    }
}
