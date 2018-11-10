//
//  MovieCollectionViewCell.swift
//  Day6Assignment
//
//  Created by MIT App Dev on 11/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.movieTableView.dataSource = self
        self.movieTableView.delegate = self
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        movieTableView.register(nib, forCellReuseIdentifier: "MovieTableViewCell")
        // Initialization code
    }

}
extension UICollectionViewCell : UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummayData.getData().count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        
        let movie = DummayData.getData()[indexPath.row]
        print(DummayData.getData())
        cell.movieImg?.image = UIImage(named: movie.movieImage)
        cell.title.text = movie.movieTitle
        cell.releaseDate.text = movie.movieReleaseDate
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}

extension UICollectionViewCell : UITableViewDelegate{
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(DummayData.getData()[indexPath.row].movieImage)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyBoard.instantiateViewController(withIdentifier: "MovieDeatilViewController")as! UINavigationController
        let vc = navigationController.viewControllers[0] as! MovieDeatilViewController
        vc.data.movieImage = DummayData.getData()[indexPath.row].movieImage
        vc.data.descText = DummayData.getData()[indexPath.row].descText
        self.window?.rootViewController?.present(navigationController, animated: true, completion:  nil)
       // self.window?.rootViewController = navigationController
    }
    
    
}
