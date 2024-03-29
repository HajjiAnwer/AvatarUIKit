//
//  AvatarBuilderUI.swift
//  builderPattern
//
//  Created by Hajji Anwer on 4/8/20.
//  Copyright © 2020 Hajji Anwer.
//

import Foundation
import UIKit
import Kingfisher

public class AvatarBuilderUI : AvatarBuilderUIProtocol{
    
    var view: UIView
    var coef : CGFloat = 1
    public init(view:UIView) {
        self.view = view
    }
    
    public func cornerRadius (radius: CGFloat) ->AvatarBuilderUI{
        self.view.layer.cornerRadius = radius
        self.view.alpha = 1
        return self
    }
    
    public func circularView() -> AvatarBuilderUI {
        self.view.layer.cornerRadius = 0.5 * (view.bounds.size.width)
        self.view.clipsToBounds = true
        return self
    }
    
    public func setBorder(borderWidth: CGFloat = 1.0 , borderColor: CGColor = UIColor.gray.cgColor) -> AvatarBuilderUI {
        self.view.layer.borderWidth = borderWidth
        self.view.layer.borderColor = borderColor
        return self
    }
    
    public func shadow(opacity: Float = 0.1, color:CGColor = UIColor.black.cgColor) -> AvatarBuilderUI {
        self.view.layer.masksToBounds = false
        self.view.layer.shadowColor = color
        self.view.layer.shadowOffset = CGSize.zero
        self.view.layer.shadowRadius = view.frame.width / 32
        self.view.layer.shadowOpacity = opacity
        self.view.layer.shouldRasterize = true
        self.view.layer.rasterizationScale = UIScreen.main.scale
        return self
    }
    
    public func scaleImage(url:String , scale:CGFloat = 1.0,type:Type, imageProcessor: ImageProcessor? = nil) -> AvatarBuilderUI {
        let imageView = addImageViewToSuperView(scale: scale,type: type)
        if !url.isValidURL {
            (imageView.image =  UIImage(named: url))
        }else{
            let url = URL(string: url)
            imageView.kf.setImage(with: url, options: imageProcessor == nil ? [.cacheOriginalImage] : [.processor(imageProcessor!)], completionHandler:  { result in
                switch result {
                case .success(_):
                    break
                case .failure(_):
                    break
                }
            })
        }
        self.view.clipsToBounds = true
        self.view.addSubview(imageView)
        self.coef = scale
        return self
    }
    
    private func addImageViewToSuperView(scale : CGFloat = 1,type:Type)->UIImageView{
        let imageView = UIImageView()
        imageView.bounds.size.width = view.frame.width * scale
        imageView.bounds.size.height = view.frame.height * scale
        imageView.center = CGPoint(x:view.frame.width / 2, y: view.frame.height / 2)
        imageView.backgroundColor = UIColor.white
        if type == .cercle{
            imageView.layer.cornerRadius = 0.5 * (view.bounds.size.width)
            imageView.clipsToBounds = true
        }
        return imageView
    }
    
    private func downloadImageWithURL(url: String , scale : CGFloat = 1,type:Type) -> UIImageView {
        let imageView = addImageViewToSuperView(scale: scale,type: type)
        if let url = URL.init(string: url) {
            imageView.downloadedFrom(url: url)
        }
        return imageView
    }
    
    public func build() -> UIView {
        return self.view
    }
    
}


extension UIImage{
    func isTransparent() -> Bool {
        guard let alpha: CGImageAlphaInfo = self.cgImage?.alphaInfo else { return false }
        return alpha == .first || alpha == .last || alpha == .premultipliedFirst || alpha == .premultipliedLast
    }
    
    func changeBackgroundColor(image: UIImage, backgroundColor: UIColor)->UIImage?{
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        backgroundColor.setFill()
        let path = UIBezierPath(rect: CGRect(origin: .zero, size: image.size))
        path.fill()
        image.draw(at: .zero)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension String {
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}

extension UIImageView{
    func downloadedFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
        }.resume()
    }
    func downloadedFrom(link: String) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url)
    }
}




