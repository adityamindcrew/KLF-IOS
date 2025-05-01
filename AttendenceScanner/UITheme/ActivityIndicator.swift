//
//  ActivityIndicator.swift
//  AttendenceScanner
//
//  Created by Tushar on 26/03/25.
//


import UIKit

class ActivityIndicator {
    
    private var container: UIView = UIView()
    private var loadingView: UIView = UIView()
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // Shared instance to access the activity indicator from anywhere in your app
    static let shared = ActivityIndicator()
    
    // Method to show activity indicator
    func show(in viewController: UIViewController, indicatorColor: UIColor = .black) {
        guard let view = viewController.view else { return }
        
        // Make sure the container covers the entire screen
        container.frame = view.bounds
        container.center = view.center
        container.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        // Loading view setup
        loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        loadingView.center = view.center
        loadingView.backgroundColor = .clear
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        // Activity Indicator setup
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.style = .large
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        activityIndicator.color = indicatorColor
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        view.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    // Method to hide activity indicator
    func hide(from viewController: UIViewController) {
        guard let view = viewController.view else { return }
        
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    // Helper method to round a string value to one decimal point
    func round(str: NSString) -> String {
        return String(format: "%.1f", str.floatValue)
    }
}
