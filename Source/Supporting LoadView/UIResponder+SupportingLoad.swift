//
//  UIResponder+SupportingLoad.swift
//  JoUIKit
//
//  Created by Django Lee on 07/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

import UIKit

extension UIResponder {
    
    private static var onceToken: Int = 0
    
    internal class func methodExchangeImplementations() {
        
        DispatchQueue.main.jo.once(token: &onceToken) {
            
            if let oldMethod = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.viewDidLoad)),
                let newMethod = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.jo_supportingLoadView)) {
                
                method_exchangeImplementations(newMethod, oldMethod)
            }
            
            if let oldMethod = class_getInstanceMethod(UIView.self, #selector(UIView.didMoveToWindow)),
                let newMethod = class_getInstanceMethod(UIView.self, #selector(UIView.jo_supportingLoadView)) {
                
                method_exchangeImplementations(newMethod, oldMethod)
            }
        }
    }
    
    @objc internal func jo_supportingLoadView() {
        
    }
}

extension UIResponder: JoSupportingLoadView {
    
    @objc open func jo_viewDidLoad() {
        
    }
    
    @objc open func jo_setupUI() {
        
    }
    
    @objc open func jo_prepareLoadView() {
        
    }
    
    @objc open func jo_setupSubviews() {
        
    }
    
    @objc open func jo_bindingSubviewsLayout() {
        
    }
}

public protocol JoSupportingLoadView: class {
    
    func jo_viewDidLoad()
    
    func jo_setupUI()
    
    func jo_prepareLoadView()
    
    func jo_setupSubviews()
    
    func jo_bindingSubviewsLayout()
}
