//
//  SearchViewController.swift
//  RodrigoRodrigues
//
//  Created by Rodrigo on 26/10/22.
//

import UIKit

class SearchViewController: UIViewController,
                            UICollectionViewDelegate,
                            UICollectionViewDataSource,
                            UICollectionViewDelegateFlowLayout,
                            UISearchBarDelegate,
                            SearchPresenterDelegate {
    
    @IBOutlet weak var sbSearch: UISearchBar!
    @IBOutlet weak var cvGallery: UICollectionView!
    
    private var presenter = SearchPresenter()
    
    //------------------------------------
    //  View Controller
    //------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
    }
    
    //------------------------------------
    // Search Bar
    //------------------------------------
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.loadData(text: sbSearch.text ?? "")
        sbSearch.resignFirstResponder()
    }
    
    //------------------------------------
    //  Collection View
    //------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell",
                                                      for: indexPath) as! ImageCell
        cell.loadUI(item: presenter.images[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width / 4), height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //------------------------------------
    //  Presenter Delegate
    //------------------------------------
    
    func dataLoaded() {
        cvGallery.reloadData()
    }
}
