//
//  HomeViewController.swift
//  mvvm
//
//  Created by Максим Спиридонов on 21.10.2019.
//  Copyright © 2019 Максим Спиридонов. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, StoryboardInitializable{
    
    
    var viewModel: HomeViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel()
        viewModel?.collectionView.collectionDelegate = self
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        title = "Top Apple Hit's"
        
        guard let viewModel = viewModel else { return }
        view.addSubview(viewModel.collectionView)
        viewModel.collectionView.fillSuperview()
    }
    
    
}

//MARK: - HomeCollectionViewDelegate
extension HomeViewController: HomeCollectionViewDelegate {
    func didSelectItemAt(appleSong: AppleSong) {
        let detailsViewController = DetailsViewController()
        detailsViewController.appleSong = appleSong
        self.present(detailsViewController, animated: true, completion: nil)
    }

}
