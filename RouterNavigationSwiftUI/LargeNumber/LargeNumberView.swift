//
//  LargeNumberView.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 6.11.21..
//

import SwiftUI

struct LargeNumberView: View {
    
    @StateObject var router: LargeNumberRouter
    
    let largeNumber: Int
    
    var body: some View {
        VStack {
            Text("\(largeNumber)")
                .font(Font.system(size: 52))
                .foregroundColor(.red)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            Button {
                router.dismiss()
            } label: {
                Text("Pop to previous")
            }
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            Button {
                router.popToRoot()
            } label: {
                Text("Pop to root")
            }
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
        }
    }
}
