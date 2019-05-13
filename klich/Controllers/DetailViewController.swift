//
//  DetailViewController.swift
//  klich
//
//  Created by Ryan Nazari on 5/10/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
//    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
//      collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as UICollectionViewCell
        cell.backgroundColor = .blue
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 30, height: 100)
    }
    
}
