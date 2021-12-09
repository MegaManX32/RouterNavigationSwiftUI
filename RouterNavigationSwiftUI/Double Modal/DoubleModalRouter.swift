//
//  DoubleModalRouter.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 8.12.21..
//

import Foundation
import SwiftUI

private enum ModalRoute {
    case tripleModal
}

class DoubleModalRouter: BaseNavigationRouter {
    private var modalRoute: ModalRoute? = nil
    
    @ViewBuilder func modalView() -> some View {
        if let modalRoute = modalRoute {
            switch modalRoute {
            case .tripleModal:
                tripleModalView()
            }
        }
    }
    
    func presentTripleModal() {
        modalRoute = .tripleModal
        isPresentingModal = true
    }
    
    private func tripleModalView() -> TripleModalView {
        let view = TripleModalView()
        view.router.parent = self
        return view
    }
}
