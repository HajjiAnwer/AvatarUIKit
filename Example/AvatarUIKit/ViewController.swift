//
//  ViewController.swift
//  AvatarUIKit
//
//  Created by HajjiAnwer on 04/13/2020.
//  Copyright (c) 2020 HajjiAnwer. All rights reserved.
//

import UIKit
import AvatarUIKit

class ViewController: UIViewController {

    @IBOutlet weak var UIViewImage: UIView!
    var viewImage = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewImage.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        let avatar = AvatarBuilderUI.init(view: UIViewImage)
        UIViewImage = avatar.circularView().border().shadow().build()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

