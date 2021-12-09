//
//  InfoView.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 8.11.21..
//

import SwiftUI

struct InfoView: View {
    
    @StateObject var router: InfoRouter
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: router.pushView(),
                               isActive: $router.isPresentingPush) {
                    EmptyView()
                }
                VStack {
                    Text("For programers by programers")
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    Button {
                        router.presentDoubleModal()
                    } label: {
                        Text("View Dobule Modal")
                    }
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    Button {
                        router.presentLegal()
                    } label: {
                        Text("View Legal")
                    }
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    Button {
                        router.dismiss()
                    } label: {
                        Text("Close")
                    }
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                }
            }
        }
        .fullScreenCover(isPresented: $router.isPresentingModal, onDismiss: {
            print("fullScreenCover dismissed")
        }) {
            router.modalView()
        }
    }
}
