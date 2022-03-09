//
//  PostCell.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import SwiftUI
import Kingfisher

struct PostCell: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5) {
                post.avatarImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50.0, height: 50.0)
                    .clipShape(Circle())
                    .overlay(
                        VIPBadge(vip: Int(post.user.vipLevel)! > 0)
                            .offset(x: 16, y: 16)
                    )
                
                VStack(alignment: .leading, spacing: 5.0) {
                    Text(post.user.nickname)
                        .font(.system(size: 16))
                        .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                        .lineLimit(1)
                    Text(post.ago)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10.0)
                
                if !post.following {
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("关注")
                            .font(.system(size: 14))
                            .foregroundColor(.orange)
                            .frame(width: 50.0, height: 26.0)
                            .overlay(
                                RoundedRectangle(cornerRadius:13)
                                    .stroke(Color.orange, lineWidth: 1))
                    })
                }
            }
            
            Text(post.content)
                .font(.system(size: 17))
            
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: screenBounds.width - 30)
            }
            
            Divider()
            
            HStack(spacing: 0) {
                Spacer()
                PostToolbarButton(image: "message",
                                  text: post.commentCountText,
                                  color: .black) {
                    print("评论")
                }
                Spacer()
                Spacer()
                PostToolbarButton(image: "heart",
                                  text: post.likeCountText,
                                  color: .black) {
                    print("点赞")
                }
                Spacer()
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(.init(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        let postRes = PostData.testData
        return PostCell(post: postRes.list[1])
    }
}
