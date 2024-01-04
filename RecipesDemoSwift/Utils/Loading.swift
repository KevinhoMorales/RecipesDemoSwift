//
//  Loading.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 3/1/24.
//

import UIKit

final class Loading {
    
    static var currentOverlay : UIView?
    static var currentOverlayTarget : UIView?
    static var currentLoadingText: String?
    
    static func show() {
        guard let currentMainWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
            print("No main window.")
            return
        }
        show(currentMainWindow)
    }
    
    static func show(_ loadingText: String) {
        guard let currentMainWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
            print("No main window.")
            return
        }
        show(currentMainWindow, loadingText: loadingText)
    }
    
    static func show(_ overlayTarget : UIView) {
        show(overlayTarget, loadingText: nil)
    }
    
    static func show(_ overlayTarget : UIView, loadingText: String?) {
        // Clear it first in case it was already shown
        hide()
        
        // Create the overlay
        let overlay = UIView()
        overlay.alpha = 0
        overlay.backgroundColor = UIColor.black
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlayTarget.addSubview(overlay)
        overlayTarget.bringSubviewToFront(overlay)
        
        overlay.widthAnchor.constraint(equalTo: overlayTarget.widthAnchor).isActive = true
        overlay.heightAnchor.constraint(equalTo: overlayTarget.heightAnchor).isActive = true
        
        // Create and animate the activity indicator
        let indicator = UIActivityIndicatorView(style: .white)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        overlay.addSubview(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor).isActive = true
        
        // Create label
        if let textString = loadingText {
            let label = UILabel()
            label.text = textString.uppercased()
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            overlay.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 16).isActive = true
            label.centerXAnchor.constraint(equalTo: indicator.centerXAnchor).isActive = true
        }
        
        // Animate the overlay to show
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        overlay.alpha = overlay.alpha > 0 ? 0 : 0.5
        UIView.commitAnimations()
        
        currentOverlay = overlay
        currentOverlayTarget = overlayTarget
        currentLoadingText = loadingText
    }
    
    static func hide() {
        if currentOverlay != nil {
            currentOverlay?.removeFromSuperview()
            currentOverlay =  nil
            currentLoadingText = nil
            currentOverlayTarget = nil
        }
    }
}
