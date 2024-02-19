//
//  PreviewPageCollectionViewController.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//

import UIKit

private let reuseIdentifier = "CollectionCell"

class PreviewPageCollectionViewController: UICollectionViewController {
    
    let imageNameArray = [
        "The Beatles - Please Please Me",
        "The Beatles - With The Beatles",
        "The Beatles - A Hard Day's Night",
        "The Beatles - Beatles For Sale",
        "The Beatles - Help!",
        "The Beatles - Rubber Soul",
        "The Beatles - Revolver",
        "The Beatles - Sgt. Pepper's Lonely Hearts Club Band",
        "The Beatles - The Beatles",
        "The Beatles - Yellow Submarine",
        "The Beatles - Abbey Road",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showCollection" {
            if let indexPath = self.collectionView.indexPathsForSelectedItems?.first {
                // Получаем выбранный индекс
                let selectedIndexPath = indexPath
                // Получаем целевой контроллер
                guard let detailVC = segue.destination as? CollectionViewController else {
                    return
                }
                // Передаем данные в целевой контроллер
                detailVC.info = imageNameArray[selectedIndexPath.row]
            }
        }
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.coverImageView.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell
    }
    
}
