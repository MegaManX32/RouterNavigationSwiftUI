//
//  QuintipleModalView.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 9.12.21..
//

import SwiftUI

struct QuintipleModalView: View {
    @StateObject var router: QuintipleModalRouter
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Quintiple Modal")
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Button {
                    router.dismiss()
                } label: {
                    Text("Dismiss quintiple modal")
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Spacer()
            }
        }
    }
}

