//
//  Dao.swift
//  collection Project
//
//  Created by comviva on 24/01/20.
//  Copyright © 2020 comviva. All rights reserved.
//

import UIKit


class  model  {
    
    var image : [UIImage] = [ UIImage.init(named: "1")! ,UIImage.init(named: "2")! , UIImage.init(named: "3")! , UIImage.init(named: "4")! ]
    var  description : [String] = ["pehli photo collection view ki"," Doosri photo collection view ki","teesri photo collection view ki"," chowthi photo collection view ki"]
     
}

class UtilClass {
    
    static let sharedInstance = UtilClass()
    
    var md = model()
}
