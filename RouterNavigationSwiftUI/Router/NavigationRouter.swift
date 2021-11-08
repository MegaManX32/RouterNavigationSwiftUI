//
//  NavigationRouter.swift
//  RouterNavigationSwiftUI
//
//  Created by Vladislav Simovic on 6.11.21..
//

import Foundation

protocol NavigationRouter: AnyObject {
    var isPresentingPush: Bool { get set }
    var isPresentingModal: Bool { get set }
    var parent: NavigationRouter? { get }
    func dismiss()
    func popToRoot()
    func dismissModal()
}

extension NavigationRouter {
    func dismiss() {
        parent?.isPresentingPush = false
        parent?.isPresentingModal = false
    }
    
    func popToRoot() {
        var currentParent = parent
        while currentParent?.parent != nil && currentParent?.isPresentingModal == false {
            currentParent = currentParent?.parent
        }
        currentParent?.isPresentingPush = false
    }
    
    func dismissModal() {
        var currentParent = parent
        while currentParent != nil  {
            if currentParent?.isPresentingModal == true {
                currentParent?.isPresentingModal = false
                return
            }
            currentParent = currentParent?.parent
        }
    }
}
