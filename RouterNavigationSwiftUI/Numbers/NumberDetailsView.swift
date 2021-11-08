//
//  NumberDetailView.swift
//  NavigationSwiftUI
//
//  Created by Vladislav Simovic on 5.11.21..
//

import SwiftUI

struct NumberDetailsView: View {
    
    @ObservedObject var router: NumberDetailsRouter = NumberDetailsRouter()
    
    let number: Int
    
    var body: some View {
        ZStack {
            NavigationLink(destination: router.pushView(),
                           isActive: $router.isPresentingPush) {
                EmptyView()
            }
            VStack {
                Text("\(number)")
                    .font(Font.system(size: 12))
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Button {
                    router.presentLargeNumber(number)
                } label: {
                    Text("ENLARGE")
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Button {
                    router.dismiss()
                } label: {
                    Text("Pop to previous")
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            }
        }
    }
}
