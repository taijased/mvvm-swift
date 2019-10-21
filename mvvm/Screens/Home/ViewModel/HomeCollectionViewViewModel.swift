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
//    func viewModelForSelectedRow() -> DetailViewModelType?
//    func selectRow(atIndexPath indexPath: IndexPath)

}

class HomeCollectionViewViewModel: HomeCollectionViewViewModelType {
    
    
    var minimumInteritemSpacingForSectionAt: CGFloat = 20.0
    var minimumLineSpacingForSectionAt: CGFloat = 40.0
    
    var cells = [
        Profile(label: "1 Game", picture: "https://cdn.shopify.com/s/files/1/2264/9031/products/Energy-preview-03_2000x.jpg?v=1569352393"),
        Profile(label: "2 Game", picture: "https://cdn.shopify.com/s/files/1/2264/9031/products/Energy-preview-03_2000x.jpg?v=1569352393"),
        Profile(label: "3 Game", picture: "https://cdn.shopify.com/s/files/1/2264/9031/products/Energy-preview-03_2000x.jpg?v=1569352393")
    ]
    
    init() {
        
        
    }
    
    
    
    func sizeForItemAt() -> CGSize {
        let width = (UIScreen.main.bounds.width - 60) * 0.5
        let height = (width * 2) / 3

        return CGSize(width: width, height: height)
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> HomeCollectionViewCellViewModelType? {
        let cell = cells[indexPath.row]
        return HomeCollectionViewCellViewModel(cell: cell)
    }
}
