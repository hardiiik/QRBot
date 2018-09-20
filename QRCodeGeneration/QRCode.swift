//
//  QRCode.swift
//  QRBot
//
//  Created by Hardik Trivedi on 20/09/18.
//

import Foundation

public class QRCode{
    
    static let defaultSession = URLSession(configuration: .default)
    static var dataTask: URLSessionDataTask?
    
    public static func generate(from data: String, completion: @escaping (UIImage?,Error?) -> Void){
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "https://api.qrserver.com/v1/create-qr-code") {
            urlComponents.query = "data=\(data)&size=512x512"
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { responseData, response, error in
                defer { self.dataTask = nil }
                if let error = error {
                    print("QRBot : Error - \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        completion(nil,error)
                    }
                } else if let data = responseData,let response = response as? HTTPURLResponse,response.statusCode == 200 {
                    DispatchQueue.main.async {
                        completion(UIImage(data: data),error)
                    }
                }
            }
            dataTask?.resume()
        }
    }
    
    public static func generate(from data: String, imageFormat format: QRCodeImageFormat,completion: @escaping (UIImage?,Error?) -> Void){
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "https://api.qrserver.com/v1/create-qr-code") {
            urlComponents.query = "data=\(data)&size=512x512&format=\(format.rawValue)"
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { responseData, response, error in
                defer { self.dataTask = nil }
                if let error = error {
                    print("QRBot : Error - \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        completion(nil,error)
                    }
                } else if let data = responseData,let response = response as? HTTPURLResponse,response.statusCode == 200 {
                    DispatchQueue.main.async {
                        completion(UIImage(data: data),error)
                    }
                }
            }
            dataTask?.resume()
        }
    }
    
    public static func generate(from data: String, patternColor color: QRCodeColor,backgroundColor bgcolor: QRCodeColor, completion: @escaping (UIImage?,Error?) -> Void){
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "https://api.qrserver.com/v1/create-qr-code") {
            urlComponents.query = "data=\(data)&size=512x512&color=\(color.rawValue)&bgcolor=\(bgcolor.rawValue)"
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { responseData, response, error in
                defer { self.dataTask = nil }
                if let error = error {
                    print("QRBot : Error - \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        completion(nil,error)
                    }
                } else if let data = responseData,let response = response as? HTTPURLResponse,response.statusCode == 200 {
                    DispatchQueue.main.async {
                        completion(UIImage(data: data),error)
                    }
                }
            }
            dataTask?.resume()
        }
    }
    
    public static func generate(from data: String, patternColor color: QRCodeColor,backgroundColor bgcolor: QRCodeColor, imageFormat format: QRCodeImageFormat, completion: @escaping (UIImage?,Error?) -> Void){
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "https://api.qrserver.com/v1/create-qr-code") {
            urlComponents.query = "data=\(data)&size=512x512&color=\(color.rawValue)&bgcolor=\(bgcolor.rawValue)&format=\(format.rawValue)"
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { responseData, response, error in
                defer { self.dataTask = nil }
                if let error = error {
                    print("QRBot : Error - \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        completion(nil,error)
                    }
                } else if let data = responseData,let response = response as? HTTPURLResponse,response.statusCode == 200 {
                    DispatchQueue.main.async {
                        completion(UIImage(data: data),error)
                    }
                }
            }
            dataTask?.resume()
        }
    }
}
public enum QRCodeColor: String{
    case red = "FF0000"
    case green = "00FF00"
    case blue = "0000FF"
    case salmon = "FF7E79"
    case maraschino = "FF2600"
    case cayenne = "941100"
    case black = "000000"
    case cantaloupe = "FFD479"
    case tangerine = "FF9300"
    case mocha = "945200"
    case lead = "212121"
    case banana = "FFFC79"
    case lemon = "FFFB00"
    case asparagus = "929000"
    case tungsten = "424242"
    case honeydew = "D4FB79"
    case lime = "8EFA00"
    case fern = "4F8F00"
    case iron = "5E5E5E"
    case flora = "73FA79"
    case spring = "00F900"
    case clover = "008F00"
    case steel = "797979"
    case spindrift = "73FCD6"
    case blueberry = "0433FF"
    case strawberry = "FF2F92"
    case magenta = "FF40FF"
    case white = "FFFFFF"
}

public enum QRCodeImageFormat: String{
    case png = "png"
    case jpg = "jpg"
    case jpeg = "jpeg"
    case gif = "gif"
}
