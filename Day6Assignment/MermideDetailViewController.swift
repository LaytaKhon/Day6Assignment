//
//  MermideDetailViewController.swift
//  Day6Assignment
//
//  Created by MIT App Dev on 11/10/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class MermideDetailViewController: UIViewController {
    var data = movieObj ()
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var imgName: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var descText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImg.image = UIImage(named: data.movieImage)
        imgName.text = data.movieImage
        titleText.text = data.movieTitle
        dateText.text = data.movieReleaseDate
        descText.text = data.descText
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
