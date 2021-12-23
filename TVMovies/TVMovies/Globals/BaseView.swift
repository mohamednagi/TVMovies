//
//  BaseView.swift
//  TVMovies
//
//  Created by Nagiz on 23/12/2021.
//

import UIKit

class BaseView: UIViewController {
    
    // MARK: - Enums
    enum storyboards: String {
        case Movies
        case MovieDetails
    }
    
    func currentStoryboard(_ storyboard: storyboards) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: nil)
    }
    
    
    // MARK: - Variables
    let screenBounds = UIScreen.main.bounds
    lazy var fullView = UIView(frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height))
    lazy var indicatorContainerView = UIView(frame: CGRect(x: self.fullView.frame.size.width / 2, y: self.fullView.frame.size.height / 2, width: 80, height: 80))
    lazy var indicator = UIActivityIndicatorView(frame: CGRect(x: self.indicatorContainerView.frame.size.width / 2, y: self.indicatorContainerView.frame.size.height / 2, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    // MARK: - Functions
    // MARK: - Setup TableView
    func setupTableView(with:String, tableView: UITableView) {
        let nib = UINib(nibName: with, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: with)
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }
    
    // MARK: - Loading View
    func drawIndicatorView() {
        fullView.backgroundColor = .black
        fullView.alpha = 0.7
        indicatorContainerView.backgroundColor = .white
        indicatorContainerView.alpha = 0.8
        indicatorContainerView.layer.cornerRadius = 12
        
        if #available(iOS 13.0, *) {
            indicator.style = .large
        } else {
            // Fallback on earlier versions
            indicator.style = .whiteLarge
        }
        indicator.color = .black
        indicator.startAnimating()
        guard let window = UIApplication.shared.windows.filter ({$0.isKeyWindow}).first else {return}
        window.addSubview(fullView)
        window.addSubview(indicatorContainerView)
        window.addSubview(indicator)
        window.bringSubviewToFront(fullView)
        window.bringSubviewToFront(indicatorContainerView)
        window.bringSubviewToFront(indicator)
        indicatorContainerView.center = fullView.center
        indicator.center = indicatorContainerView.center
        
    }
    
    func startLoading() {
        drawIndicatorView()
        fullView.isHidden = false
        indicatorContainerView.isHidden = false
        indicator.isHidden = false
    }
    
    func endLoading() {
        DispatchQueue.main.async {
            self.fullView.isHidden = true
            self.indicatorContainerView.isHidden = true
            self.indicator.isHidden = true
            self.fullView.removeFromSuperview()
            self.indicator.removeFromSuperview()
            self.indicatorContainerView.removeFromSuperview()
        }
    }
}
