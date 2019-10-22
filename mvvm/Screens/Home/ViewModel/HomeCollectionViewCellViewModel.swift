//
//  HomeCollectionViewCellViewModel.swift
//  mvvm
//
//  Created by Максим Спиридонов on 21.10.2019.
//  Copyright © 2019 Максим Спиридонов. All rights reserved.
//

import UIKit

protocol HomeCollectionViewCellViewModelType: class {
    var label: String { get }
    var imageURL: String { get }
}



class HomeCollectionViewCellViewModel: HomeCollectionViewCellViewModelType {
    
    private var profile: AppleSong

    var label: String {
        return profile.name
    }

    var imageURL: String {
        return profile.artworkUrl100
    }
    
    
    init(cell: AppleSong) {
        self.profile = cell
    }
}
