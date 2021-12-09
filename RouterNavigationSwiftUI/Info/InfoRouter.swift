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


private enum ModalRoute {
    case doubleModal
}

class InfoRouter: BaseNavigationRouter {
    private var pushRoute: PushRoute? = nil
    private var modalRoute: ModalRoute? = nil
    
    @ViewBuilder func pushView() -> some View {
        if let pushRoute = pushRoute {
            switch pushRoute {
            case .legal:
                legalView()
            }
        }
    }
    
    @ViewBuilder func modalView() -> some View {
        if let modalRoute = modalRoute {
            switch modalRoute {
            case .doubleModal:
                doubleModalView()
            }
        }
    }

    // MARK: - Legal
    
    func presentLegal() {
        pushRoute = .legal
        isPresentingPush = true
    }
    
    func presentDoubleModal() {
        modalRoute = .doubleModal
        isPresentingModal = true
    }
    
    private func legalView() -> LegalView {
        let view = LegalView()
        view.router.parent = self
        return view
    }
    
    private func doubleModalView() -> DoubleModalView {
        let router = DoubleModalRouter()
        router.parent = self
        return DoubleModalView(router: router)
    }
}
