# **QRBot**

A QR Code Scanning and Generating library for iOS 8+, written in Swift 4.

[![CI Status](https://img.shields.io/travis/hardiiik/QRBot.svg?style=flat)](https://travis-ci.org/hardiiik/QRBot)
[![Version](https://img.shields.io/cocoapods/v/QRBot.svg?style=flat)](https://cocoapods.org/pods/QRBot)
[![License](https://img.shields.io/cocoapods/l/QRBot.svg?style=flat)](https://cocoapods.org/pods/QRBot)
[![Platform](https://img.shields.io/cocoapods/p/QRBot.svg?style=flat)](https://cocoapods.org/pods/QRBot)

## Requirements

`iOS 8+`

## Installation

QRBot is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'QRBot'
```

## Usage

Follow the steps to use QRBot:

- **Steps for scanning QR Code:**

1. You need to give permission to access Camera in `Info.plist`.

![Info.plist permission](QRBot/Assets/Info_plist.png)

2. Make `QRCodeScannerViewController` superclass of your ViewController class.

```swift
 class ViewController: QRCodeScannerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 }
```

3. Conform/ Implement `QRCodeScannerDelegate` protocol and implement its method to perform your tasks.

```swift
 class ViewController: QRCodeScannerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 }
 extension ViewController: QRCodeScannerDelegate{
    func scanner(_ connection: AVCaptureConnection, didOutput data: String) {
        print("DemoApp : Data from QR Code - \(data)")
        // Perform your actions here with data from QRCode
    }
 }
```
( If `AVCaptureConnection` may show any error, just import `AVFoundation` in your ViewController. )

```swift
 import UIKit
 import AVFoundation
 import QRBot
 
 class ViewController: QRCodeScannerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 }
 extension ViewController: QRCodeScannerDelegate{
    func scanner(_ connection: AVCaptureConnection, didOutput data: String) {
        print("DemoApp : Data from QR Code - \(data)")
        // Perform your actions here with data from QRCode
    }
 }
```

4. Set `scannerDelegate` property of your ViewController to `self`.

```swift
 class ViewController: QRCodeScannerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        scannerDelegate = self
    }
 }
```
5. All set. Now implement your tasks in delegate method.

- **Steps for generating QR Code from your own data:**

1. Import QRBot in your ViewController.

```swift
 import QRBot
```
2. Call `generate()` method of `QRCode` class as shown below:

```swift
 import UIKit
 import QRBot
 class YourViewController: UIViewController{
    ovveride func viewDidLoad(){
        super.viewDidLoad()
        QRCode.generate(from: yourStringData,completion: { (image,error) in
            if error == nil{
                if let qrCodeImage = image{
                    // Set qrCodeImage to your ImageView
                    self.imageView.image = qrCodeImage // For example
                }
            }
        })
    }
 }
```
3. Below the list of supported methods are given. Their usages are as same as shown above.

    1) Simple Black & White QR Code from your String data
    
    ```swift 
    QRCode.generate(from data: String, completion: @escaping (UIImage?,Error?) -> Void)
    ```
    
    2) Simple Black & White QRCode from your String data, with Image format you wish
    
    ```swift 
    QRCode.generate(from data: String, imageFormat format: QRCodeImageFormat,completion: @escaping (UIImage?,Error?) -> Void)
    ```
    
    Here, `QRCodeImageFormat` is enum having values like `.png`, `.jpg`, `.jpeg`, `.gif`.
    
    3) QRCode with different Pattern Colour and Background Colour
    
    ```swift 
    QRCode.generate(from data: String, patternColor color: QRCodeColor,backgroundColor bgcolor: QRCodeColor, completion: @escaping (UIImage?,Error?) -> Void)
    ```
    
    Here, `QRCodeColor` is enum, having all colours from Apple Colour Pallete.
    
    4) QRCode with different Pattern Colour and Background Colour, with Image format you wish
    
    ```swift
    QRCode.generate(from data: String, patternColor color: QRCodeColor,backgroundColor bgcolor: QRCodeColor, imageFormat format: QRCodeImageFormat, completion: @escaping (UIImage?,Error?) -> Void)
    ```
    
## Example

Take a look at Example Project for more clarity. To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Hardik Trivedi, hardiktrivedi3008.ht@gmail.com

**Made with :heart: in India.**
