//
//  MyCell.swift
//  klich
//
//  Created by Ryan Nazari on 5/13/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class ItemCell: UICollectionViewCell {
    
    
    
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descLable: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
