//
//  GenerateQRCodeViewController.swift
//  QRBot_Example
//
//  Created by Hardik Trivedi on 20/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import QRBot

class GenerateQRCodeViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityView.hidesWhenStopped = true
    }
    
    @IBAction func generateQRCode(_ sender: UIButton) {
        activityView.startAnimating()
        QRCode.generate(from: textField.text!, completion: { (image,error) in
            if error == nil{
                if let _ = image{
                    self.activityView.stopAnimating()
                    self.imageView.image = image!
                }
            }
        })
    }
    
    @IBAction func generateColoringQRCode(_ sender: UIButton) {
        activityView.startAnimating()
        QRCode.generate(from: textField.text!, patternColor: .blueberry, backgroundColor: .strawberry, completion: { (image,error) in
            if error == nil{
                if let _ = image{
                    self.activityView.stopAnimating()
                    self.imageView.image = image!
                }
            }
        })
    }
}
