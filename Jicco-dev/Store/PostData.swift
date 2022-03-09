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
        let data = await request(PostApi.post.list(reload ? 0 : cursor, pageSize))
        last = data.last
        if reload {
            list = data.list
        } else {
            list += data.list
        }
    }
    
}

extension PostData {
    static let testData: PostRes = {
        return loadTestData("PostListData.json")
    }()
    
    static let testDataImage: [PostImage] = {
        return loadTestData("PostImageData.json")
    }()
}

func loadTestData<T: Decodable>(_ fileName: String) -> T {
    let url = Bundle.main.url(forResource: fileName, withExtension: nil)
    let data = try? Data(contentsOf: url!)
    let result = try? JSONDecoder().decode(T.self, from: data!)
    return result!
}

