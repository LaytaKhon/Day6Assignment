//
//  MermaidListViewController.swift
//  Day6Assignment
//
//  Created by MIT App Dev on 11/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class MermaidListViewController: UIViewController {

    @IBOutlet weak var gridImgCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gridImgCollectionView.dataSource = self
        self.gridImgCollectionView.delegate = self
        
        CellRegisterUtil.cellRegister(nibName: "gridCollectionViewCell", collectionView: self.gridImgCollectionView)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DummayData.getMermide().count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCollectionViewCell", for: indexPath) as! gridCollectionViewCell
        let obj = DummayData.getMermide()[indexPath.row]
        cell.gridImg.image = UIImage(named: obj.movieImage)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 5, height: 180)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Hello")
        let obj = DummayData.getMermide()[indexPath.row]
        let st = UIStoryboard(name: "Main", bundle: nil)
        let nav = st.instantiateViewController(withIdentifier: "MermideDetailViewController") as! UINavigationController
        let vc = nav.viewControllers[0] as! MermideDetailViewController
        vc.data.movieImage = obj.movieImage
        vc.data.descText = obj.descText
        vc.data.movieTitle = obj.movieTitle
        vc.data.movieReleaseDate = obj.movieReleaseDate
        self.present(nav, animated: true, completion: nil)
    }

}







