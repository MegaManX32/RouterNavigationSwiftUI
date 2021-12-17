//
//  LegalView.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 8.11.21..
//

import SwiftUI

struct LegalView: View {
    
    @StateObject var router: LegalRouter
    
    var body: some View {
        VStack {
            Text("Created by Vladislav Simovic for personal use only")
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            Button {
                router.dismiss()
            } label: {
                Text("Pop")
            }
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            Button {
                router.dismissModal()
            } label: {
                Text("Close nearest modal")
            }
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
        }
    }
}
