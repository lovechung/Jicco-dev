//
//  PostData.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import Foundation

class PostData: ObservableObject {
    
    @Published var list = [Post]()
    @Published var last = 0
    
    @MainActor
    func getList(cursor: Int, pageSize: Int, _ reload: Bool) async {
        let data = await request(PostApi.post.get(reload ? 0 : cursor, pageSize))
        last = data.last
        if reload {
            list = data.list
        } else {
            list += data.list
        }
    }
    
}
