//
//  LoadingScreen.swift
//  QR Attendance
//
//  Created by Ram Sri Charan on 4/20/18.
//  Copyright © 2018 Ram Sri Charan. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    class func displaySpinner(onView : UIView, Message : String) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.7)
        
        // Loading spinner
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        
        // Spinner message
        let label = UILabel.init()
        label.text = Message
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        // Stack View to hold them
        let stack = UIStackView.init(frame: CGRect(x : 0,y : 0,width : 100,height : 100))
        stack.axis = .vertical
        stack.center = spinnerView.center
        
        
        DispatchQueue.main.async {
            spinnerView.addSubview(stack)
            
            stack.addArrangedSubview(ai)
            ai.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
            
            stack.addArrangedSubview(label)
            label.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
            
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
