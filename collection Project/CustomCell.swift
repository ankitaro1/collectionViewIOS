//
//  CustomCell.swift
//  collection Project
//
//  Created by comviva on 24/01/20.
//  Copyright © 2020 comviva. All rights reserved.
//

import UIKit


protocol PassData {
    func passBack(data :String)
    func hide()
}

class CustomCell: UICollectionViewCell {

    var delegate : PassData!
    var data = ""
    
    @IBOutlet weak var imageViewer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewer.isUserInteractionEnabled = true
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        imageViewer.addGestureRecognizer(tapGest)
        let  twoTapGest = UITapGestureRecognizer(target: self, action: #selector(self.hideDescription))
        twoTapGest.numberOfTapsRequired = 2
        imageViewer.addGestureRecognizer(twoTapGest)
    }
   
    @objc func hideDescription(){
        delegate.hide()
    }
    
    @objc func tapGesture(){
        if (imageViewer.image == UIImage.init( named: "1")){
            
            data = UtilClass.sharedInstance.md.description[0]
            delegate.passBack(data: data)
        }
        else if (imageViewer.image == UIImage.init( named: "2")){
            data = UtilClass.sharedInstance.md.description[1]
            delegate.passBack(data: data)
        }
        else if (imageViewer.image == UIImage.init( named: "3")){
            data = UtilClass.sharedInstance.md.description[2]
            delegate.passBack(data: data)
        }
        else if (imageViewer.image == UIImage.init(named: "4")) {
            data = UtilClass.sharedInstance.md.description[3]
            delegate.passBack(data: data)
        }
        else {
            data =  UtilClass.sharedInstance.md.description[4]
            delegate.passBack(data: data)
        }
        
    }
   

}
