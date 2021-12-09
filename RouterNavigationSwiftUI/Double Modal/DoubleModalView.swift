//
//  DoubleModalView.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 8.12.21..
//

import SwiftUI

struct DoubleModalView: View {
    @StateObject var router: DoubleModalRouter
    @State private var id = UUID().uuidString
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Double Modal")
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Button {
                    router.presentTripleModal()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        id = UUID().uuidString
                    }
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
            .id(id)
        }
        .fullScreenCover(isPresented: $router.isPresentingModal, onDismiss: {
            print("fullScreenCover dismissed")
        }) {
            router.modalView()
        }
    }
}
