//
//  Services.swift
//  Kafak Store
//
//  Created by Techimmense Software Solutions on 20/09/24.
//

import UIKit
import Alamofire

class Service {
    
    static let sharedSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 120
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        return Session(configuration: configuration)
    }()
    
    // MARK: - POST API Request
    class func post(url urlString: String, params: [String: Any]?, method: HTTPMethod, vc parentVC: UIViewController, successBlock success: @escaping (Data) -> Void, failureBlock failure: @escaping (Error) -> Void) {
        
        guard Utility.checkNetworkConnectivityWithDisplayAlert(isShowAlert: true) else {
            parentVC.hideProgressBar()
            Utility.showAlertMessage(withTitle: "", message: NETWORK_ERROR_MSG, delegate: nil, parentViewController: parentVC)
            return
        }
        
        var urlComponents = ""
        if let parameters = params {
            for (key, value) in parameters {
                urlComponents += "\(key)=\(value)&"
            }
        }
        print("Full_Api_For_Browser → \(urlString)?\(urlComponents)")
        
        //        let configuration = URLSessionConfiguration.default
        //        configuration.timeoutIntervalForRequest = 120
        //        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        //        let session = Session(configuration: configuration)
        
        sharedSession.request(urlString, method: method, parameters: params, encoding: URLEncoding.default)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    success(data)
                case .failure(let error):
                    print("Request failed: \(error.localizedDescription)")
                    failure(error)
                }
            }
    }
    
    
    // MARK: - APPDELEGATE POST API Request
    class func kAppDelegatePost(url urlString: String, params: [String: Any]?, method: HTTPMethod, successBlock success: @escaping (Data) -> Void, failureBlock failure: @escaping (Error) -> Void) {
        
        guard Utility.checkNetworkConnectivityWithDisplayAlert(isShowAlert: true) else {
            return
        }
        
        //        let configuration = URLSessionConfiguration.default
        //        configuration.timeoutIntervalForRequest = 120
        //        let session = Session(configuration: configuration)
        
        sharedSession.request(urlString, method: method, parameters: params, encoding: URLEncoding.default)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    success(data)
                case .failure(let error):
                    print("Request failed: \(error.localizedDescription)")
                    failure(error)
                }
            }
    }
    
    
    // MARK: - Upload Single Media (Image + Video)
    class func postSingleMedia(url urlString: String, params: [String: String]?, imageParam: [String: UIImage?]?, videoParam: [String: Data?]?, parentViewController parentVC: UIViewController, successBlock success: @escaping (Data) -> Void, failureBlock failure: @escaping (Error) -> Void) {
        
        guard Utility.checkNetworkConnectivityWithDisplayAlert(isShowAlert: true) else {
            parentVC.hideProgressBar()
            Utility.showAlertMessage(withTitle: "", message: NETWORK_ERROR_MSG, delegate: nil, parentViewController: parentVC)
            return
        }
        
        var urlComponents = ""
        if let parameters = params {
            for (key, value) in parameters {
                urlComponents += "\(key)=\(value)&"
            }
        }
        print("Full_Api_For_Browser → \(urlString)?\(urlComponents)")
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.upload(multipartFormData: { multipartFormData in
            if let parameters = params {
                for (key, value) in parameters {
                    if let data = value.data(using: .utf8) {
                        multipartFormData.append(data, withName: key)
                    }
                }
            }
            
            if let images = imageParam {
                for (key, image) in images {
                    if let img = image, let imageData = img.jpegData(compressionQuality: 0.5) {
                        multipartFormData.append(imageData, withName: key, fileName: "\(key).jpg", mimeType: "image/jpeg")
                    }
                }
            }
            
            if let videos = videoParam {
                for (key, data) in videos {
                    if let videoData = data {
                        multipartFormData.append(videoData, withName: key, fileName: "\(key).mp4", mimeType: "video/mp4")
                    }
                }
            }
        }, to: urlString, headers: headers)
        .uploadProgress { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                success(data)
            case .failure(let error):
                print("Upload failed: \(error.localizedDescription)")
                failure(error)
            }
        }
    }
    
    
    // MARK: - Upload with Multiple Media Arrays
    class func postWithMedia(url urlString: String, params: [String: String]?, imageParam: [String: [Any]?]?, videoParam: [String: [Any]?]?, vc parentVC: UIViewController, successBlock success: @escaping (Data) -> Void, failureBlock failure: @escaping (Error) -> Void) {
        
        guard Utility.checkNetworkConnectivityWithDisplayAlert(isShowAlert: true) else {
            parentVC.hideProgressBar()
            Utility.showAlertMessage(withTitle: "", message: NETWORK_ERROR_MSG, delegate: nil, parentViewController: parentVC)
            return
        }
        
        var urlComponents = ""
        if let parameters = params {
            for (key, value) in parameters {
                urlComponents += "\(key)=\(value)&"
            }
        }
        print("Full_Api_For_Browser → \(urlString)?\(urlComponents)")
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.upload(multipartFormData: { multipartFormData in
            if let parameters = params {
                for (key, value) in parameters {
                    if let data = value.data(using: .utf8) {
                        multipartFormData.append(data, withName: key)
                    }
                }
            }
            
            if let images = imageParam {
                for (key, array) in images {
                    if let imageArray = array {
                        for imageItem in imageArray {
                            if let image = imageItem as? UIImage, let imageData = image.jpegData(compressionQuality: 0.5) {
                                multipartFormData.append(imageData, withName: key, fileName: "\(key).jpg", mimeType: "image/jpeg")
                            }
                        }
                    }
                }
            }
            
            if let videos = videoParam {
                for (key, array) in videos {
                    if let videoArray = array {
                        for videoItem in videoArray {
                            if let fileURL = videoItem as? URL {
                                multipartFormData.append(fileURL, withName: key, fileName: "\(key).mp4", mimeType: "video/mp4")
                            }
                        }
                    }
                }
            }
        }, to: urlString, headers: headers)
        .uploadProgress { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                success(data)
            case .failure(let error):
                print("Upload failed: \(error.localizedDescription)")
                failure(error)
            }
        }
    }
    
    
    // MARK: - POST API using JSON
    class func callPostService(apiUrl urlString: String, parameters params: [String: Any]?, method: HTTPMethod, parentViewController parentVC: UIViewController, successBlock success: @escaping (AnyObject, String) -> Void, failureBlock failure: @escaping (Error) -> Void) {
        
        guard Utility.checkNetworkConnectivityWithDisplayAlert(isShowAlert: true) else {
            parentVC.hideProgressBar()
            Utility.showAlertMessage(withTitle: "", message: NETWORK_ERROR_MSG, delegate: nil, parentViewController: parentVC)
            return
        }
        
        var urlComponents = ""
        if let parameters = params {
            for (key, value) in parameters {
                urlComponents += "\(key)=\(value)&"
            }
        }
        print("Full_Api_For_Browser → \(urlString)?\(urlComponents)")
        
        //        let configuration = URLSessionConfiguration.default
        //        configuration.timeoutIntervalForRequest = 120
        //        let session = Session(configuration: configuration)
        
        sharedSession.request(urlString, method: method, parameters: params, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print(response.request?.url ?? "URL not available")
                    success(value as AnyObject, "Successful")
                case .failure(let error):
                    print(response.request?.url ?? "URL not available")
                    print("Error: \(error.localizedDescription)")
                    failure(error)
                }
            }
    }
    
    
    // MARK: - Upload with Data Files
    class func postWithData(url urlString: String, params: [String: String]?, imageParam: [String: Data?]?, videoParam: [String: Data?]?, parentViewController parentVC: UIViewController, successBlock success: @escaping (Data) -> Void, failureBlock failure: @escaping (Error) -> Void) {
        
        guard Utility.checkNetworkConnectivityWithDisplayAlert(isShowAlert: true) else {
            parentVC.hideProgressBar()
            Utility.showAlertMessage(withTitle: "", message: NETWORK_ERROR_MSG, delegate: nil, parentViewController: parentVC)
            return
        }
        
        var urlComponents = ""
        if let parameters = params {
            for (key, value) in parameters {
                urlComponents += "\(key)=\(value)&"
            }
        }
        print("Full_Api_For_Browser → \(urlString)?\(urlComponents)")
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.upload(multipartFormData: { multipartFormData in
            if let parameters = params {
                for (key, value) in parameters {
                    if let data = value.data(using: .utf8) {
                        print("Field Name: \(key), Value: \(value)")
                        multipartFormData.append(data, withName: key)
                    }
                }
            }
            
            if let images = imageParam {
                for (key, data) in images {
                    if let fileData = data {
                        multipartFormData.append(fileData, withName: key, fileName: "\(key).pdf", mimeType: "application/pdf")
                    }
                }
            }
            
            if let videos = videoParam {
                for (key, data) in videos {
                    if let fileData = data {
                        multipartFormData.append(fileData, withName: key, fileName: "\(key).mp4", mimeType: "video/mp4")
                    }
                }
            }
        }, to: urlString, headers: headers)
        .uploadProgress { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                success(data)
            case .failure(let error):
                print("Upload failed: \(error.localizedDescription)")
                failure(error)
            }
        }
    }
}
