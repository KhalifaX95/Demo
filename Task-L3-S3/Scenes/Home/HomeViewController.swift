//
//  HomeViewController.swift
//  Task-L3-S3
//
//  Created by Mohamed Khalifa on 30/12/2025.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    let screens: [ScreenType] = [.screen1, .screen2, .screen3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()

    }
    
    func setUpCollectionView() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        resgisterCells()
        
        if let layout = homeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
        homeCollectionView.isPagingEnabled = true
        
        
        homeCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func resgisterCells() {
        let nib = UINib(nibName:Screen1CollectionViewCell.identifier , bundle: .main)
        homeCollectionView.register(nib, forCellWithReuseIdentifier: Screen1CollectionViewCell.identifier)
        
        let nib2 = UINib(nibName:Screen2CollectionViewCell.identifier , bundle: .main)
        homeCollectionView.register(nib2, forCellWithReuseIdentifier: Screen2CollectionViewCell.identifier)
        
        let nib3 = UINib(nibName:Screen3CollectionViewCell.identifier , bundle: .main)
        homeCollectionView.register(nib3, forCellWithReuseIdentifier: Screen3CollectionViewCell.identifier)
    }

}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        screens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentScreen = screens[indexPath.row]
        
        switch currentScreen {
            
        case .screen1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:Screen1CollectionViewCell.identifier, for: indexPath) as! Screen1CollectionViewCell
            return cell
        case .screen2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:Screen2CollectionViewCell.identifier, for: indexPath) as! Screen2CollectionViewCell
            return cell
        case .screen3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:Screen3CollectionViewCell.identifier, for: indexPath) as! Screen3CollectionViewCell
            return cell
            
        }
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
