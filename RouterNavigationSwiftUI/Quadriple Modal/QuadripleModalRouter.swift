//
//  QuadripleModalRouter.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 9.12.21..
//

import Foundation
import SwiftUI

private enum ModalRoute {
    case quintipleModal
}

class QuadripleModalRouter: BaseNavigationRouter {
    private var modalRoute: ModalRoute? = nil
    
    @ViewBuilder func modalView() -> some View {
        if let modalRoute = modalRoute {
            switch modalRoute {
            case .quintipleModal:
                quintipleModalView()
            }
        }
    }
    
    func presentQuintipleModal() {
        modalRoute = .quintipleModal
        isPresentingModal = true
    }
    
    private func quintipleModalView() -> QuintipleModalView {
        let view = QuintipleModalView()
        view.router.parent = self
        return view
    }
}
