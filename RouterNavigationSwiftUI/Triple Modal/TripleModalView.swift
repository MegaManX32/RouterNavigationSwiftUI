//
//  TripleModalView.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 9.12.21..
//

import SwiftUI

struct TripleModalView: View {
    @StateObject var router: TripleModalRouter
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Triple Modal")
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Button {
                    router.presentQuadripleModal()
                } label: {
                    Text("Present quadriple modal")
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Button {
                    router.dismiss()
                } label: {
                    Text("Dismiss triple modal")
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
