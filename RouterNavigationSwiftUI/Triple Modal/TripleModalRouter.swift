//
//  TripleModalRouter.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 9.12.21..
//

import Foundation
import SwiftUI

private enum ModalRoute {
    case quadripleModal
}

class TripleModalRouter: BaseNavigationRouter {
    private var modalRoute: ModalRoute? = nil
    
    @ViewBuilder func modalView() -> some View {
        if let modalRoute = modalRoute {
            switch modalRoute {
            case .quadripleModal:
                quadripleModalView()
            }
        }
    }
    
    func presentQuadripleModal() {
        modalRoute = .quadripleModal
        isPresentingModal = true
    }
    
    private func quadripleModalView() -> QuadripleModalView {
        let view = QuadripleModalView()
        view.router.parent = self
        return view
    }
}
