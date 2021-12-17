//
//  HomeRouter.swift
//  NavigationSwiftUI
//
//  Created by Vladislav Simovic on 6.11.21..
//

import Foundation
import SwiftUI

private enum PushRoute {
    case numberDetails(Int)
}

private enum ModalRoute {
    case info
    case infoLegal
}

class HomeRouter: BaseNavigationRouter {
    private var pushRoute: PushRoute? = nil
    private var modalRoute: ModalRoute? = nil
    
    @ViewBuilder func pushView() -> some View {
        if let pushRoute = pushRoute {
            switch pushRoute {
            case .numberDetails(let number):
                numberDetailsView(number: number)
            }
        }
    }
    
    @ViewBuilder func modalView() -> some View {
        if let modalRoute = modalRoute {
            switch modalRoute {
            case .info:
                infoView()
            case .infoLegal:
                infoLegalView()
            }
        }
    }

    // MARK: - Number Details
    
    func presentDetailsWithNumber(_ number: Int) {
        pushRoute = .numberDetails(number)
        isPresentingPush = true
    }
    
    private func numberDetailsView(number: Int) -> NumberDetailsView {
        let router = NumberDetailsRouter()
        router.parent = self
        return NumberDetailsView(router: router, number: number)
    }
    
    // MARK: - Info
    
    func presentInfo() {
        modalRoute = .info
        isPresentingModal = true
    }
    
    private func infoView() -> InfoView {
        let router = InfoRouter()
        router.parent = self
        return InfoView(router: router)
    }
    
    // MARK: - Present Info Legal (Notification simulation)
    
    func presentInfoLegal() {
        modalRoute = .infoLegal
        isPresentingModal = true
    }
    
    private func infoLegalView() -> InfoView {
        let router = InfoRouter()
        router.parent = self
        let view = InfoView(router: router)
        router.presentLegal()
        return view
    }
}
