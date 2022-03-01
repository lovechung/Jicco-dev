//
//  PostList.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import SwiftUI

struct PostList: View {
    @EnvironmentObject var postData: PostData
    @State private var pageSize = 10
    
    var body: some View {
        List {
            ForEach(postData.list.indices, id: \.self) { index in
                ZStack {
                    PostCell(post: postData.list[index])
                        .onAppear {
                            let last = postData.last
                            if index == postData.list.count - 2 && last != 0 {
                                loadMore(last)
                            }
                        }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
            }
        }
        .listStyle(GroupedListStyle())
        .onAppear {
            UITableView.appearance().showsVerticalScrollIndicator = false
        }
        .task {
            reload()
        }
        .refreshable {
            reload()
        }
    }
    
    func reload() {
        Task {
            await postData.getList(cursor: 0, pageSize: pageSize, true)
        }
    }
    
    func loadMore(_ cursor: Int) {
        Task {
            await postData.getList(cursor: cursor, pageSize: pageSize, false)
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
