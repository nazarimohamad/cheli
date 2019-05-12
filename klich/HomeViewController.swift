//
//  HomeViewController.swift
//  klich
//
//  Created by Ryan Nazari on 5/10/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var menuView: FilterView!
    @IBOutlet weak var goalButton: UIButton!
    @IBOutlet weak var ideaButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeView()
    }
    
    
    @IBAction func filterButton(_ sender: FilterButton) {
        
        UIView.animate(withDuration: 0.3) {
            if self.menuView.transform == .identity {
                self.closeView()
            } else {
                self.menuView.transform = .identity
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            if self.menuView.transform == .identity {
                self.goalButton.transform = .identity
                self.ideaButton.transform = .identity
                self.addButton.transform = .identity
            }
        })
    }
    
    func closeView() {
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        goalButton.transform = CGAffineTransform(translationX: 0, y: 15)
        ideaButton.transform = CGAffineTransform(translationX: 10, y: 10)
        addButton.transform = CGAffineTransform(translationX: 15, y: 0)
    }
    

}

// MARK: add button functionality
extension HomeViewController {
    
    @IBAction func goalButton(_ sender: Any) {
    }
    
    @IBAction func ideaButton(_ sender: Any) {
    }
    
    @IBAction func addButton(_ sender: Any) {
//        let controller = DetailViewController()
//
//        controller.modalPresentationStyle = .custom
//        controller.transitioningDelegate = self.transition
//
//        self.present(controller, animated: true, completion: nil)
    }
    
    
}
