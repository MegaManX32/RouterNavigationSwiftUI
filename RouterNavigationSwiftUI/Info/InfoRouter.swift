//
//  InfoRouter.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 8.11.21..
//

import Foundation

import SwiftUI

private enum PushRoute {
    case legal
}

class InfoRouter: BaseNavigationRouter {
    private var pushRoute: PushRoute? = nil
    
    @ViewBuilder func pushView() -> some View {
        if let pushRoute = pushRoute {
            switch pushRoute {
            case .legal:
                legalView()
            }
        }
    }

    // MARK: - Legal
    
    func presentLegal() {
        pushRoute = .legal
        isPresentingPush = true
    }
    
    private func legalView() -> LegalView {
        let view = LegalView()
        view.router.parent = self
        return view
    }
}
