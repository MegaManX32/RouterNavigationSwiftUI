//
//  QuadripleModalView.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 9.12.21..
//

import SwiftUI

struct QuadripleModalView: View {
    @ObservedObject var router: QuadripleModalRouter = QuadripleModalRouter()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Quadriple Modal")
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Button {
                    router.presentQuintipleModal()
                } label: {
                    Text("Present quintiple modal")
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Button {
                    router.dismiss()
                } label: {
                    Text("Dismiss quadriple modal")
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
