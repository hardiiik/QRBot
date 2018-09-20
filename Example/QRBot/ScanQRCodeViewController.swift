//
//  ViewController.swift
//  QRBot
//
//  Created by hardiiik on 09/20/2018.
//  Copyright (c) 2018 hardiiik. All rights reserved.
//

import UIKit
import QRBot
import AVFoundation

class ScanQRCodeViewController: QRCodeScannerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Demo App : From viewDidLoad()")
        scannerDelegate = self
    }

}

extension ScanQRCodeViewController: QRCodeScannerDelegate{
    func scanner(_ connection: AVCaptureConnection, didOutput data: String) {
        print("DemoApp : Data from QR Code - \(data)")
        // Perform your actions here with data from QRCode
    }
}

