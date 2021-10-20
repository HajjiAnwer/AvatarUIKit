//
//  ViewController.swift
//  AvatarUIKit
//
//  Created by HajjiAnwer on 04/13/2020.
//  Copyright (c) 2020 HajjiAnwer. All rights reserved.
//

import UIKit
import AvatarUIKit
import SVGKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var UIViewImage: UIView!
    var viewImage = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewImage.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        let avatar = AvatarBuilderUI.init(view: UIViewImage)
        UIViewImage = avatar.circularView().shadow().scaleImage(url: "https://storage.googleapis.com/macro-context-245510_merchant_dev/b29df7218b1236d5083e6c4a73e20cf44e38cce5f4b9a60c45d4d09ce586fcd8.svg", scale: 0.7, type: .square, imageProcessor: SVGImgProcessor()).setBorder(borderWidth: 2, borderColor: UIColor.blue.cgColor).build()
        // Do any additional setup after loading the view, typically from a nib.
    }


}



public struct SVGImgProcessor: ImageProcessor {
    public var identifier: String = "com.spare.money"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
