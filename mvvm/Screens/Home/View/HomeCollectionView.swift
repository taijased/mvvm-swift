//
//  HomeCollectionView.swift
//  mvvm
//
//  Created by Максим Спиридонов on 21.10.2019.
//  Copyright © 2019 Максим Спиридонов. All rights reserved.
//

import UIKit


protocol HomeCollectionViewDelegate: class {
    func didSelectItemAt(appleSong: AppleSong)
}



class HomeCollectionView: UICollectionView {
    
    var viewModel: HomeCollectionViewViewModelType?
    weak var collectionDelegate: HomeCollectionViewDelegate?

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        
        viewModel = HomeCollectionViewViewModel()
        
        viewModel?.onReloadData = { [weak self] in
            self?.reloadData()
        }
        
        setupUI()
    }
    
    
    fileprivate func setupUI() {
        setupCollectionSettings()
    }
    
    fileprivate func setupCollectionSettings() {
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsets(top: Constants.padding, left:  Constants.padding, bottom: 0, right:  Constants.padding)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension HomeCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseId, for: indexPath) as? HomeCollectionViewCell
        
        guard let collectionViewCell = cell, let viewModel = viewModel else { return UICollectionViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        collectionViewCell.viewModel = cellViewModel
        
        return collectionViewCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        viewModel.selectItem(atIndexPath: indexPath)
        guard let appleSong = viewModel.viewModelForSelectedRow() else { return }
        collectionDelegate?.didSelectItemAt(appleSong: appleSong)
    }
}



// MARK: - UICollectionViewDelegateFlowLayout
extension HomeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel?.sizeForItemAt() ?? CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel?.minimumInteritemSpacingForSectionAt ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel?.minimumLineSpacingForSectionAt ?? 0
    }
}
