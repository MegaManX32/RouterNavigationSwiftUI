//
//  NumbersRouter.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 6.11.21..
//

import Foundation
import SwiftUI

private enum PushRoute {
    case enlargeNumber(Int)
}

class NumberDetailsRouter: BaseNavigationRouter {
    private var pushRoute: PushRoute? = nil
    
    @ViewBuilder func pushView() -> some View {
        if let pushRoute = pushRoute {
            switch pushRoute {
            case .enlargeNumber(let number):
                largeNumberView(number: number)
            }
        }
    }
    
    // MARK: - Enlarge Number
    
    func presentLargeNumber(_ number: Int) {
        self.pushRoute = .enlargeNumber(number)
        isPresentingPush = true
    }
    
    private func largeNumberView(number: Int) -> LargeNumberView {
        let view = LargeNumberView(largeNumber: number)
        view.router.parent = self
        return view
    }
}

