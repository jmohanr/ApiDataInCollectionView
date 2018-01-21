//
//  HomeViewController.swift
//  JaganInterViewTest
//
//  Created by Ammulu on 20/01/18.
//  Copyright © 2018 JaganMohan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
 var heroes = [HeroStats]()
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showHud("Please Wait data is Loading....")
        downloadJSON ()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
    }
    func downloadJSON() {
        
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                    self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    
                }catch {
                    print("JSON Error")
                }
                DispatchQueue.main.async {
                    self.hideHUD()
                    self.collectionView.reloadData()
                      }
                
                 }
            }.resume()
    }

}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! DataCollectionViewCell
        cell.displayName.text = heroes[indexPath.row].localized_name.capitalized
        let defaultLink = "https://api.opendota.com"
        let completeLink = defaultLink + heroes[indexPath.row].img
        cell.displayImage.downloadedFrom(link: completeLink)
        cell.displayImage.clipsToBounds = true
        cell.displayImage.layer.cornerRadius = cell.displayImage.frame.height / 2
        cell.displayImage.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController:DataViewController = UIStoryboard(
            name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        viewController.hero = heroes[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
extension HomeViewController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 11, 30, 11)
    }
}
