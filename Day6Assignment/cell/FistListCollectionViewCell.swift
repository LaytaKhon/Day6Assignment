//
//  FistListCollectionViewCell.swift
//  Day6Assignment
//
//  Created by MIT App Dev on 11/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class FistListCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var fishCollectionView: UICollectionView!
    var img : [String] = ["pic6","pic7","pic8","pic9","pic10","pic11"]
    override func awakeFromNib() {
        super.awakeFromNib()
        btn2.addTarget(self, action: #selector(onClickMore), for: .touchUpInside)
        self.fishCollectionView.dataSource = self
        self.fishCollectionView.delegate = self
        
        CellRegisterUtil.cellRegister(nibName: "FistImgCollectionViewCell", collectionView: self.fishCollectionView)
        // Initialization code
    }
    
    @IBAction func onClickMore(){
        print("click more")
        let st :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nav = st.instantiateViewController(withIdentifier: "MermaidListViewController") as! UINavigationController
       // nav.viewControllers[0] as! MermaidListViewController
        //self.window?.rootViewController = nav
       self.window?.rootViewController?.present(nav, animated: true, completion: nil)
        
    }

}
extension FistListCollectionViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FistImgCollectionViewCell", for: indexPath) as! FistImgCollectionViewCell
        cell.fishCellImg.image = UIImage(named: self.img[indexPath.row])
        
        return cell
    }
    
    
}

extension FistListCollectionViewCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
