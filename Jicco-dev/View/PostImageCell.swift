//
//  PostImageCell.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import SwiftUI
import Kingfisher

private let imageSpace: CGFloat = 4

struct PostImageCell: View {
    let images: [PostImage]
    let width: CGFloat
    
    var body: some View {
        Group {
            if images.count == 1 {
                KFImage(URL(string: self.images[0].url))
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width * 0.75)
                    .clipped()
            } else if images.count == 2 {
                PostImageCellRow(images: images, width: width)
            } else if images.count == 3 {
                PostImageCellRow(images: images, width: width)
            } else if images.count == 4 {
                VStack(alignment: .center, spacing: imageSpace) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...3]), width: width)
                }
            } else if images.count == 5 {
                VStack(alignment: .center, spacing: imageSpace) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...4]), width: width)
                }
            } else if images.count == 6 {
                VStack(alignment: .center, spacing: imageSpace) {
                    PostImageCellRow(images: Array(images[0...2]), width: width)
                    PostImageCellRow(images: Array(images[3...5]), width: width)
                }
            }
        }
    }
}

struct PostImageCellRow: View {
    let images: [PostImage]
    let width: CGFloat
    
    var body: some View {
        HStack(alignment: .center, spacing: imageSpace) {
            ForEach(images, id: \.self) { image in
                KFImage(URL(string: image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(width: (self.width - imageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count),
                           height: (self.width - imageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count))
                    .clipped()
            }
        }
    }
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        PostImageCell(images: [], width: 0)
    }
}
