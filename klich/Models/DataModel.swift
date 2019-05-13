//
//  DataModel.swift
//  klich
//
//  Created by Ryan Nazari on 5/13/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import RealmSwift


class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var vision: String = ""
//    @objc dynamic var imgName: Data = UIImage()
    
}
