//
//  VIPBadge.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import SwiftUI

struct VIPBadge: View {
    let vip: Bool
    
    var body: some View {
        if vip {
            Text("v")
                .bold()
                .font(.system(size: 11))
                .frame(width: 15, height: 15)
                .foregroundColor(.yellow)
                .background(Color.red)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 7.5)
                        .stroke(Color.white, lineWidth: 1)
                )
        }
    }
}

struct VIPBadge_Previews: PreviewProvider {
    static var previews: some View {
        VIPBadge(vip: true)
    }
}
