//
//  ViewController.swift
//  Day6Assignment
//
//  Created by MIT App Dev on 11/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.delegate = self
        cellRegister()
    }
    
    func cellRegister() {
        CellRegisterUtil.cellRegister(nibName: "ImageCollectionViewCell", collectionView: self.mainCollectionView)
        CellRegisterUtil.cellRegister(nibName: "FistListCollectionViewCell", collectionView: self.mainCollectionView)
        CellRegisterUtil.cellRegister(nibName: "FistImgCollectionViewCell", collectionView: self.mainCollectionView)
        CellRegisterUtil.cellRegister(nibName: "MovieCollectionViewCell", collectionView: self.mainCollectionView)
    }


}
extension UIViewController : UICollectionViewDataSource{
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath)as! ImageCollectionViewCell
            return cell
        }else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FistListCollectionViewCell", for: indexPath) as! FistListCollectionViewCell
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            return cell
        }
    }
    
    
}

extension UIViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: self.view.frame.width, height: 200)
        }
        else if indexPath.section == 1 {
            return CGSize(width: self.view.frame.width, height: 180)
        }
        else{
            return CGSize(width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if indexPath.section == 0 {
            let navigationController = storyBoard.instantiateViewController(withIdentifier: "AdsDetailViewController") as! UINavigationController
            
            navigationController.viewControllers[0] as! AdsDetailViewController
            self.present(navigationController, animated: true, completion: nil)
        }
    }
}
