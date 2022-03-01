//
//  PostToolbarButton.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import SwiftUI

struct PostToolbarButton: View {
    let image: String
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size: 15))
            }
        }
        .foregroundColor(color)
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct PostToolbar_Previews: PreviewProvider {
    static var previews: some View {
        PostToolbarButton(image: "heart", text: "1.1k", color: .red) {
            print("Click")
        }
    }
}
