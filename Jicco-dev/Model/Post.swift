//
//  Post.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import Foundation
import Kingfisher

struct PostRes: Decodable {
    var last: Int
    var list: [Post]
}

struct Post: Decodable, Identifiable {
    var id: Int
    // 圈子id
    var circleId: Int
    // 圈子名称
    var circleName: String
    // 作者信息
    var user: PostAuthor
    // 是否已关注
    var following: Bool
    // 动态内容
    var content: String
    // 动态提及列表
    @Default<Array>
    var mentions: [PostMention]
    // 动态图片列表
    @Default<Array>
    var images: [PostImage]
    // 详情位置信息
    @Default<String>
    var address: String
    // 发布距离现在时间
    var ago: String
    // 发布时间戳
    var timestamp: Int
    // 是否已点赞
    var like = false
    // 点赞数
    @Default<Int>
    var likeCount: Int
    // 评论数
    @Default<Int>
    var commentCount: Int
    // 浏览数
    @Default<Int>
    var visitCount: Int
    // 是否置顶
    var pinned: Bool
    // 是否加精
    var picked: Bool
    // 是否图片敏感
    var sensitive: Bool
    // 是否关闭评论
    var commentOff: Bool
    // 是否被删除
    @Default<Bool>
    var deleted: Bool
}

struct PostAuthor: Decodable {
    // 作者id
    var userId: Int
    // 作者头像
    var avatar: String
    // 作者昵称
    var nickname: String
    // 会员等级
    @Default<String.Zero>
    var vipLevel: String
    // 管理圈子名称
    @Default<String>
    var manageCircle: String
}

struct PostMention: Decodable {
    // 提及人id
    var mentionId: Int
    // 提及人名称
    var mentionName: String
}

struct PostImage: Decodable, Hashable {
    // 图片地址
    var url: String
    // 图片原始宽度
    var width: Int
    // 图片原始高度
    var height: Int
}

extension Post {
    var avatarImage: KFImage {
        return KFImage(URL(string: user.avatar))
    }
    
    var commentCountText: String {
        if commentCount <= 0 { return "评论" }
        if commentCount < 1000 { return "\(commentCount)" }
        return String(format: "%.1fK", Double(commentCount) / 1000)
    }
    
    var likeCountText: String {
        if likeCount <= 0 { return "点赞" }
        if likeCount < 1000 { return "\(likeCount)" }
        return String(format: "%.1fK", Double(likeCount) / 1000)
    }
}
