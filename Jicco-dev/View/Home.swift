//
//  Home.swift
//  Jicco-dev
//
//  Created by admin on 2022/3/2.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
//            PostList().environmentObject(PostData())
            UserList().environmentObject(UserData())
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
