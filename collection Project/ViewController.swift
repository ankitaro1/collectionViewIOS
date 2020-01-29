//
//  ViewController.swift
//  collection Project
//
//  Created by comviva on 24/01/20.
//  Copyright © 2020 comviva. All rights reserved.
//

import UIKit



class ViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource , PassData , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var popView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    
    
    override func viewDidLoad(){
    super.viewDidLoad()
        let itemSize = UIScreen.main.bounds.width / 2
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
       
        
        collectionView.collectionViewLayout = layout
    let nib = UINib(nibName: "CustomCell", bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UtilClass.sharedInstance.md.image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.delegate = self
        cell.imageViewer.image = UtilClass.sharedInstance.md.image[indexPath.row]
        return cell
    }
    
     func passBack(data: String) {
           textLabel.text = data
       }
       
       func hide() {
           textLabel.text = ""
       }
       
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        self.view.addSubview(popView)
        popView.center = self.view.center
        self.view.isOpaque = true
    
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
       let controller = UIImagePickerController()
       controller.delegate = self
       controller.sourceType = .camera
       popView.removeFromSuperview()
       present(controller, animated: true, completion: nil)
    }
    @IBAction func galleryPressed(_ sender: UIButton) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        popView.removeFromSuperview()
        present(controller, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        UtilClass.sharedInstance.md.image.append(pickedImage)
        UtilClass.sharedInstance.md.description.append("default description")
        dismiss(animated: true, completion: nil)
        collectionView.reloadData()
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        popView.removeFromSuperview()
    }
    
}
