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
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        guard let viewModel = viewModel else { return }
        view.addSubview(viewModel.collectionView)
        viewModel.collectionView.fillSuperview()
    }
    
}
