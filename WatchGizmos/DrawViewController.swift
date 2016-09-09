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
    let colorButton = UIButton()
    let penButton = UIButton()
    let widthButton = UIButton()
    let drawingView = ACEDrawingView()

    override func viewDidLoad() {
        super.viewDidLoad()

        drawingView.backgroundColor = .white
        drawingView.frame = view.frame
        view.addSubview(drawingView)
        
    }
}
