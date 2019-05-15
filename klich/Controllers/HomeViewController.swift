//
//  HomeViewController.swift
//  klich
//
//  Created by Ryan Nazari on 5/10/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit


let notificationKey = "notificationKey"

class HomeViewController: UIViewController {

    
    let realm = try! Realm()
    var item: Results<Item>?
    
    let createTodo = CreateTodo()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuView: FilterView!
    @IBOutlet weak var goalButton: UIButton!
    @IBOutlet weak var ideaButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    
    
    @IBAction func addButton(_ sender: Any) {
        createTodo.createNewItem()
        createTodo.newItemDelegate = self
    }
    
  
    func save(item: Object) {
        
        do {
            try realm.write {
                realm.add(item)
                
            }
        } catch {
            print("there is error to save data")
        }
        collectionView.reloadData()
    }

    
    func loadData() {
        item = realm.objects(Item.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeView()
        loadData()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
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
        item = realm.objects(Item.self)
        UIView.performWithoutAnimation {
            self.item = self.item?.filter("vision CONTAINS[cd] %@", self.goalButton.currentTitle ?? "Goal").sorted(byKeyPath: "date", ascending: true)
            self.collectionView.reloadData()
        }
      
    }
    
    @IBAction func ideaButton(_ sender: Any) {
        item = realm.objects(Item.self)
        UIView.performWithoutAnimation {
            self.item = self.item?.filter("vision CONTAINS[cd] %@", self.ideaButton.currentTitle ?? "Idea").sorted(byKeyPath: "date", ascending: true)
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func contactButton(_ sender: Any) {
    }

    
}

// MARK: Extenssion collectionview
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ItemCell
        
        cell.backgroundColor = #colorLiteral(red: 0.1922, green: 0.1922, blue: 0.1922, alpha: 1) /* #313131 */
        cell.layer.cornerRadius = 10
        cell.titleLable.text = item?[indexPath.item].title
        cell.titleLable.textColor = .white
        cell.descLable.text = item?[indexPath.item].desc
        cell.descLable.textColor = .white
        let vision = item?[indexPath.item].vision
        if vision == "Goal" {
            cell.image.image = UIImage(named: "goal")
            cell.image.tintColor = .white
        } else {
            cell.image.image = UIImage(named: "idea")
            cell.image.tintColor = .white
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 30, height: 90)
    }

}



// MARK: Extenssion new item
extension HomeViewController: AddNewItemDelegate {
    
    func addNewItem(item: Object) {
        save(item: item)
    }
}

