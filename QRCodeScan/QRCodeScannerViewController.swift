//
//  QRCodeScannerViewController.swift
//  QRBot
//
//  Created by Hardik Trivedi on 19/09/18.
//

import UIKit
import AVFoundation

open class QRCodeScannerViewController: UIViewController {

    // MARK: - Variables for Camera preview and Code highlighting
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    // MARK: - QRScanner delegate variable
    
    open var scannerDelegate: QRCodeScannerDelegate!
    
    // MARK: - View Controller Life cycle methods
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // First check permission to access Camera
        checkCameraAccessAuthorization()
    }

    // MARK: - Supporting methods/Actions
    
    private func checkCameraAccessAuthorization(){
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            print("QRBot : Camera Access Authorized.")
            setUpCameraPreview()
            
        case .notDetermined:
            print("QRBot : Camera Access not determined.")
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    print("QRBot : Camera Access Granted.")
                    self.setUpCameraPreview()
                }
            }
            
        case .denied:
            print("QRBot : Camera Access Denied.")
            return
        case .restricted:
            print("QRBot : Camera Access Restricted.")
            return
        }
    }
    
    private func setUpCameraPreview(){
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            print("QRBot : This device has no Camera.")
            return
        }
        do{
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input)
        }catch let error{
            print(error.localizedDescription)
            return
        }
        
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetadataOutput)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        captureSession.startRunning()
    }
    
    // MARK: - Navigation

    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension QRCodeScannerViewController: AVCaptureMetadataOutputObjectsDelegate{
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            print("QRBot : QR Code is not found.")
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                scannerDelegate.scanner(connection, didOutput: metadataObj.stringValue!)
            }
        }
    }
}
