//
//  DrawingViewController.swift
//  DrawDigits
//
//  Created by DzEagle on 5/31/17.
//  Copyright © 2017 dung.le. All rights reserved.
//

import UIKit


class DrawingViewController: UIViewController {
    
    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var thumbView: UIImageView!
    weak var digitButton: UIBarButtonItem!
    
    let ai = MnistNet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thumbView.layer.borderWidth = 1
        thumbView.layer.borderColor = UIColor.lightGray.cgColor
        
        let digitButton = UIBarButtonItem(title: "?", style: .plain, target: nil, action: nil)
        let clearButton = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(handleClearButton))
        navigationItem.rightBarButtonItems = [clearButton, digitButton]
        self.digitButton = digitButton
        
        canvasView.delegate = self
    }
    
    @objc private func handleClearButton(sender: AnyObject!) {
        canvasView.clear()
    }
}


extension DrawingViewController : CanvasViewDelegate {
    
    func canvasViewDidFinishDrawing(canvas: CanvasView) {
        let magic = ImageMagic()
        
        guard let image = canvas.getImage(),
            let mnistImage = magic.mnist(image: image),
            let data = magic.mnistData(image: image)
            else {
                digitButton.title = "?"
                return
        }
        
        thumbView.image = mnistImage
        let predicted = ai.predict(input: data)
        digitButton.title = String(predicted)
    }
    
    func canvasViewDidClear(canvas: CanvasView) {
        thumbView.image = nil
        digitButton.title = "?"
    }
}
