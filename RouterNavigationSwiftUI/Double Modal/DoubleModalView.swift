//
//  DoubleModalView.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 8.12.21..
//

import SwiftUI

struct DoubleModalView: View {
    @ObservedObject var router: DoubleModalRouter = DoubleModalRouter()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Double Modal")
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Button {
                    router.presentTripleModal()
                } label: {
                    Text("Present triple modal")
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Button {
                    router.dismiss()
                } label: {
                    Text("Dismiss double modal")
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $router.isPresentingModal, onDismiss: {
            print("fullScreenCover dismissed")
        }) {
            router.modalView()
        }
    }
}
