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
                PostImageCellSingle(image: images[0], width: width)
            } else if images.count == 2 {
                PostImageCellMulti(images: images, width: width / 1.5)
            } else if images.count == 3 {
                PostImageCellMulti(images: images, width: width)
            } else if images.count == 4 {
                VStack(alignment: .leading, spacing: imageSpace) {
                    PostImageCellMulti(images: Array(images[0...1]), width: width / 1.5)
                    PostImageCellMulti(images: Array(images[2...3]), width: width / 1.5)
                }
            } else if images.count == 5 {
                VStack(alignment: .leading, spacing: imageSpace) {
                    PostImageCellMulti(images: Array(images[0...2]), width: width)
                    PostImageCellMulti(images: Array(images[3...4]), width: width / 1.5)
                }
            } else if images.count == 6 {
                VStack(alignment: .leading, spacing: imageSpace) {
                    PostImageCellMulti(images: Array(images[0...2]), width: width)
                    PostImageCellMulti(images: Array(images[3...5]), width: width)
                }
            } else if images.count == 7 {
                VStack(alignment: .leading, spacing: imageSpace) {
                    PostImageCellMulti(images: Array(images[0...2]), width: width)
                    PostImageCellMulti(images: Array(images[3...5]), width: width)
                    PostImageCellMulti(images: Array(images[6...6]), width: width / 3)
                }
            } else if images.count == 8 {
                VStack(alignment: .leading, spacing: imageSpace) {
                    PostImageCellMulti(images: Array(images[0...2]), width: width)
                    PostImageCellMulti(images: Array(images[3...5]), width: width)
                    PostImageCellMulti(images: Array(images[6...7]), width: width / 1.5)
                }
            } else if images.count == 9 {
                VStack(alignment: .leading, spacing: imageSpace) {
                    PostImageCellMulti(images: Array(images[0...2]), width: width)
                    PostImageCellMulti(images: Array(images[3...5]), width: width)
                    PostImageCellMulti(images: Array(images[6...8]), width: width)
                }
            }
        }
    }
}

struct PostImageCellSingle: View {
    let image: PostImage
    let width: CGFloat
    
    
    
    var body: some View {
        var imageWidth: CGFloat = CGFloat(image.width)
        var imageHeight: CGFloat = CGFloat(image.height)
        let maxWidth: CGFloat = self.width
        let maxHeight: CGFloat = 300
        
        if imageWidth > imageHeight {
            if imageWidth > maxWidth {
                imageHeight = maxWidth * imageHeight / imageWidth
                imageWidth = maxWidth
            }
        } else {
            if imageHeight > maxHeight {
                imageWidth = maxHeight * imageWidth / imageHeight
                imageHeight = maxHeight
            }
        }

        return KFImage(URL(string: image.url))
            .resizable()
            .scaledToFill()
            .frame(width: imageWidth, height: imageHeight)
            .clipped()
    }
}

struct PostImageCellMulti: View {
    let images: [PostImage]
    let width: CGFloat
    
    var body: some View {
        HStack(alignment: .center, spacing: imageSpace) {
            ForEach(images, id: \.self) { image in
                let size = (width - imageSpace * CGFloat(images.count - 1)) / CGFloat(images.count)
                KFImage(URL(string: image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipped()
            }
        }
    }
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let images = PostData.testDataImage
        let width = UIScreen.main.bounds.width
        return Group {
            PostImageCell(images: Array(images[0...0]), width: width)
            PostImageCell(images: Array(images[1...1]), width: width)
            PostImageCell(images: Array(images[2...2]), width: width)
            PostImageCell(images: Array(images[0...1]), width: width)
            PostImageCell(images: Array(images[0...2]), width: width)
            PostImageCell(images: Array(images[0...3]), width: width)
            PostImageCell(images: Array(images[0...4]), width: width)
            PostImageCell(images: Array(images[0...5]), width: width)
            PostImageCell(images: Array(images[0...6]), width: width)
            PostImageCell(images: Array(images[0...7]), width: width)
        }
        .previewLayout(.fixed(width: width, height: 450))
    }
}
