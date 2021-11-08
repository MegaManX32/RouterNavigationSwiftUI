//
//  BaseNavigationRouter.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 8.11.21..
//

import Foundation
import Combine

class BaseNavigationRouter: NavigationRouter, ObservableObject {
    @Published var isPresentingPush = false
    @Published var isPresentingModal = false
    var parent: NavigationRouter?
}
