//
//  CellRegisterUtil.swift
//  Day6Assignment
//
//  Created by MIT App Dev on 11/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import UIKit
class CellRegisterUtil {
    static func cellRegister(nibName : String , collectionView : UICollectionView) {
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
}

