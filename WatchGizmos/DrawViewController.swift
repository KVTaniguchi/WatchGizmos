//
//  DrawViewController.swift
//  WatchGizmos
//
//  Created by Kevin Taniguchi on 9/5/16.
//  Copyright © 2016 com.Taniguchi. All rights reserved.
//

import UIKit
import ACEDrawingView

class DrawViewController: UIViewController {
    let undoButton = UIButton()
    let redoButton = UIButton()
    let clearButton = UIButton()
    let penButton = UIButton()
    let widthButton = UIButton()
    let drawingView = ACEDrawingView()
    let widthSlider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()

        drawingView.backgroundColor = .white
        drawingView.frame = view.frame
        view.addSubview(drawingView)
        
        setUpButtons()
        setUpSlider()
    }
}

extension DrawViewController {
    func setUpSlider() {
        widthSlider.maximumValue = 20
        widthSlider.minimumValue = 1
        widthSlider.value = 10
        widthSlider.isHidden = true
        widthSlider.translatesAutoresizingMaskIntoConstraints = false
        drawingView.addSubview(widthSlider)
        widthSlider.bottomAnchor.constraint(equalTo: penButton.topAnchor, constant: -15).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[widthSlider]-10-|", options: [], metrics: nil, views: ["widthSlider": widthSlider]))
    }
    
    func setUpButtons() {
        undoButton.setTitle(NSLocalizedString("Undo", comment: ""), for: .normal)
        redoButton.setTitle(NSLocalizedString("Redo", comment: ""), for: .normal)
        clearButton.setTitle(NSLocalizedString("Clear", comment: ""), for: .normal)
        penButton.setTitle(NSLocalizedString("Pen + Text", comment: ""), for: .normal)
        widthButton.setTitle(NSLocalizedString("Width", comment: ""), for: .normal)
        
        undoButton.addTarget(self, action: #selector(undoButtonPressed), for: .touchUpInside)
        redoButton.addTarget(self, action: #selector(redoButtonPressed), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonPressed), for: .touchUpInside)
        penButton.addTarget(self, action: #selector(penButtonPressed), for: .touchUpInside)
        widthButton.addTarget(self, action: #selector(widthButtonPressed), for: .touchUpInside)
        
        let buttons = ["undoButton": undoButton, "redoButton": redoButton, "clearButton": clearButton, "penButton": penButton, "widthButton": widthButton]
        
        for button in buttons.values {
            button.setTitleColor(view.tintColor, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            drawingView.addSubview(button)
        }
        
        undoButton.topAnchor.constraint(equalTo: drawingView.topAnchor, constant: 66).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[undoButton(clearButton)]-40-[redoButton(clearButton)]-40-[clearButton]", options: [.alignAllTop, .alignAllBottom], metrics: nil, views: buttons))
        penButton.bottomAnchor.constraint(equalTo: drawingView.bottomAnchor, constant: -15).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[penButton]-40-[widthButton(penButton)]", options: [.alignAllTop, .alignAllBottom], metrics: nil, views: buttons))
    }
}

extension DrawViewController {
    func undoButtonPressed() {
        drawingView.undoLatestStep()
    }
    
    func redoButtonPressed() {
        drawingView.redoLatestStep()
    }
    
    func clearButtonPressed() {
        drawingView.clear()
    }
    
    func penButtonPressed() {
        
    }
    
    func widthButtonPressed() {
        widthSlider.isHidden = !widthSlider.isHidden
    }
}

//- (IBAction)undo:(id)sender
//{
//    [self.drawingView undoLatestStep];
//    [self updateButtonStatus];
//    }
//    
//    - (IBAction)redo:(id)sender
//{
//    [self.drawingView redoLatestStep];
//    [self updateButtonStatus];
//    }
//    
//    - (IBAction)clear:(id)sender
//{
//    [self.drawingView clear];
//    [self updateButtonStatus];
//}
