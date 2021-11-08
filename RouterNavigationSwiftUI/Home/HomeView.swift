//
//  HomeVIew.swift
//  NavigationSwiftUI
//
//  Created by Vladislav Simovic on 5.11.21..
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var router: HomeRouter = HomeRouter()
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: router.pushView(),
                               isActive: $router.isPresentingPush) {
                    EmptyView()
                }
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            router.presentInfo()
                        } label: {
                            Text("Info")
                        }
                        Spacer()
                        Button {
                            router.presentInfoLegal()
                        } label: {
                            Text("Info Legal")
                        }
                        Spacer()
                    }
                    ScrollView {
                        VStack {
                            ForEach(0..<100) { item in
                                HStack {
                                    Spacer()
                                    Text("\(item)")
                                        .font(Font.system(size: 18))
                                        .frame(height: 44)
                                        .padding(.trailing, 50)
                                        .onTapGesture {
                                            router.presentDetailsWithNumber(item)
                                        }
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Numbers")
            }
        }
        .navigationViewStyle(.stack)
        .fullScreenCover(isPresented: $router.isPresentingModal) {
            router.modalView()
        }
    }
}
