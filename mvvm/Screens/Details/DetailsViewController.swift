//
//  DetailsViewController.swift
//  mvvm
//
//  Created by Максим Спиридонов on 21.10.2019.
//  Copyright © 2019 Максим Спиридонов. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var appleSong: AppleSong?
    
    let myImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let labelSongName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(32)
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        return label
    }()
    
    
    
    let buttonAppleMusic: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .random()
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowRadius = 1.0
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = false
        button.setTitle("Apple Music URL", for: UIControl.State.normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        
        
        
        view.addSubview(myImageView)
        myImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myImageView.set(imageURL: appleSong?.artworkUrl100)
        
        
        view.addSubview(labelSongName)
        labelSongName.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 150).isActive = true
        labelSongName.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelSongName.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        labelSongName.text = appleSong?.name
        
        
        
        view.addSubview(buttonAppleMusic)
        buttonAppleMusic.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        buttonAppleMusic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
        buttonAppleMusic.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22).isActive = true
        buttonAppleMusic.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    @objc fileprivate func buttonTapped(_ sender: UIButton) {
        sender.flash()
        
        guard let stringURL =  appleSong?.url else { return }
        if let url = URL(string: stringURL) {
            UIApplication.shared.open(url)
        }
    }
}
