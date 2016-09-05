//
//  ControllersProtocol.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/4/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import Foundation
import PKHUD

protocol ControllersProtocol {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func showEmptyView()
}

extension ControllersProtocol where Self: UIViewController {
    
    func showLoading() {
        HUD.show(.Progress)
    }
    
    func hideLoading() {
        HUD.flash(.LabeledSuccess(title: nil, subtitle: nil), delay: 1.0)
    }
    
    func showError(message: String) {
        HUD.flash(.LabeledError(title: nil, subtitle: message), delay: 1.5)
    }
    
    func showEmptyView() {
        
    }
}