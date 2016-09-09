//
//  CurrentStickerViewController.swift
//  WatchGizmos
//
//  Created by Kevin Taniguchi on 9/5/16.
//  Copyright © 2016 com.Taniguchi. All rights reserved.
//

import UIKit

class CurrentStickerViewController: UIViewController {
    let currentSticker = UIImageView()
    let drawButton = UIButton()
    let galleryButton = UIButton()
    let updateButton = UIButton()
    let currentStickerHeight = UIScreen.main.bounds.width - 30
    let stickerHeight = (UIScreen.main.bounds.width - 30)/3

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "⌚️ Stickers"
        
        setUpButtons()
        setUpLayout()
    }
}

extension CurrentStickerViewController {
    func setUpLayout() {
        
        galleryButton.backgroundColor = .orange
        drawButton.backgroundColor = .blue
        updateButton.backgroundColor = .green
        
        currentSticker.backgroundColor = .red
        
        currentSticker.heightAnchor.constraint(equalToConstant: currentStickerHeight).isActive = true
        currentSticker.widthAnchor.constraint(equalToConstant: currentStickerHeight).isActive = true
        galleryButton.heightAnchor.constraint(equalToConstant: stickerHeight).isActive = true
        drawButton.heightAnchor.constraint(equalToConstant: stickerHeight).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: stickerHeight).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [currentSticker, galleryButton, drawButton, updateButton])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: [], metrics: nil, views: ["stackView": stackView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-60-[stackView]|", options: [], metrics: nil, views: ["stackView": stackView]))
    }
}

extension CurrentStickerViewController {
    func setUpButtons() {
        galleryButton.setTitle(NSLocalizedString("Gallery", comment: ""), for: .normal)
        drawButton.setTitle(NSLocalizedString("Draw", comment: ""), for: .normal)
        updateButton.setTitle(NSLocalizedString("Update", comment: ""), for: .normal)
        galleryButton.addTarget(self, action: #selector(galleryButtonPressed), for: .touchUpInside)
        drawButton.addTarget(self, action: #selector(drawButtonPressed), for: .touchUpInside)
        updateButton.addTarget(self, action: #selector(updateButtonPressed), for: .touchUpInside)
    }
    
    func galleryButtonPressed() {
        
    }
    
    func updateButtonPressed() {
        
    }
    
    func drawButtonPressed() {
        
    }
}
