//
//  HomeCollectionViewViewModel.swift
//  mvvm
//
//  Created by Максим Спиридонов on 21.10.2019.
//  Copyright © 2019 Максим Спиридонов. All rights reserved.
//

import UIKit


protocol HomeCollectionViewViewModelType {
    
    var minimumInteritemSpacingForSectionAt: CGFloat { get }
    var minimumLineSpacingForSectionAt: CGFloat { get }
    func sizeForItemAt() -> CGSize
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> HomeCollectionViewCellViewModelType?
    func viewModelForSelectedRow() -> AppleSong?
    func selectItem(atIndexPath indexPath: IndexPath)
    var onReloadData: (() -> Void)? { get set }
}





class HomeCollectionViewViewModel: HomeCollectionViewViewModelType {
    var onReloadData: (() -> Void)?
    
    
    
    private var dataFetcherService = DataFetcherService()
    private var selectedIndexPath: IndexPath?
    
    var minimumInteritemSpacingForSectionAt: CGFloat = 20.0
    var minimumLineSpacingForSectionAt: CGFloat = 40.0
    
    var cells: [AppleSong]?
    
    init() {
        self.dataFetcherService.fetchRSSAppleMusic { [weak self ](feed) in
            self?.cells = feed?.feed.results ?? nil
            self?.onReloadData?()
        }
    }
    
    
    func sizeForItemAt() -> CGSize {
        let width = (UIScreen.main.bounds.width - 60) * 0.5
        let height = (width * 2) / 3
        
        return CGSize(width: width, height: height)
    }
    
    
    
    func numberOfRows() -> Int {
        return cells?.count ?? 0
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> HomeCollectionViewCellViewModelType? {
        guard let cells = cells else { return nil }
        let cell = cells[indexPath.row]
        return HomeCollectionViewCellViewModel(cell: cell)
    }
    
    func viewModelForSelectedRow() -> AppleSong? {
        guard let selectedIndexPath = selectedIndexPath, let cells = cells else { return nil }
        return cells[selectedIndexPath.row]
    }
    
    
    func selectItem(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    
    
}
