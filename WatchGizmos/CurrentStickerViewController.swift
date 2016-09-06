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

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "⌚️ Stickers"
        
        setUpLayout()
    }
}

extension CurrentStickerViewController {
    func setUpLayout() {
        
        currentSticker.backgroundColor = .red
        galleryButton.setTitle(NSLocalizedString("Gallery", comment: ""), for: .normal)
        drawButton.setTitle(NSLocalizedString("Draw", comment: ""), for: .normal)
        updateButton.setTitle(NSLocalizedString("Update", comment: ""), for: .normal)
        
        currentSticker.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        currentSticker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        
        
        let stackView = UIStackView(arrangedSubviews: [currentSticker, galleryButton, drawButton, updateButton])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: [], metrics: nil, views: ["stackView": stackView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-60-[stackView]|", options: [], metrics: nil, views: ["stackView": stackView]))
    }
}
