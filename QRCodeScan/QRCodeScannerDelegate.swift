//
//  QRCodeScannerDelegate.swift
//  QRBot
//
//  Created by Hardik Trivedi on 19/09/18.
//

import AVFoundation

public protocol QRCodeScannerDelegate {
    func scanner(_ connection: AVCaptureConnection, didOutput data: String)
}
