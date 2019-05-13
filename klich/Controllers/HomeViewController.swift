//
//  HomeViewController.swift
//  klich
//
//  Created by Ryan Nazari on 5/10/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import RealmSwift


class HomeViewController: UIViewController {

    
    let realm = try! Realm()
    var item: Results<Item>?
    
    let createTodo = CreateTodo()
    
    @IBOutlet weak var menuView: FilterView!
    @IBOutlet weak var goalButton: UIButton!
    @IBOutlet weak var ideaButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    
    
    @IBAction func addButton(_ sender: Any) {
        createTodo.createNewItem()
    }
    
//    
//    func save(item: Object) {
//        
//        do {
//            try realm.write {
//                realm.add(item)
//                print(item)
//            }
//        } catch {
//            print("there is error to save data")
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeView()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
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
                self.contactButton.transform = .identity
            }
        })
    }
    
    func closeView() {
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        goalButton.transform = CGAffineTransform(translationX: 0, y: 15)
        ideaButton.transform = CGAffineTransform(translationX: 10, y: 10)
        contactButton.transform = CGAffineTransform(translationX: 15, y: 0)
    }
}

// MARK: button functionality
extension HomeViewController {
    
    @IBAction func goalButton(_ sender: Any) {
    }
    @IBAction func ideaButton(_ sender: Any) {
    }
    @IBAction func contactButton(_ sender: Any) {
    }

    
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ItemCell
        cell.backgroundColor = .cyan
        cell.layer.cornerRadius = 10
        cell.titleLable.text = "hellow"
        cell.descLable.text = "this is forom description"
        cell.image.image = UIImage(named: "add")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 30, height: 90)
    }

}
