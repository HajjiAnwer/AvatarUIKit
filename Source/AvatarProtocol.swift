//
//  AvatarProtocol.swift
//  builderPattern
//
//  Created by Hajji Anwer on 4/8/20.
//  Copyright © 2020 Hajji Anwer. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

public protocol AvatarBuilderUIProtocol {
    func circularView() -> AvatarBuilderUI
    func setBorder(borderWidth : CGFloat, borderColor : CGColor) -> AvatarBuilderUI
    func shadow(opacity: Float, color:CGColor ) ->AvatarBuilderUI
    func scaleImage(url:String,scale:CGFloat,type:Type, imageProcessor: ImageProcessor?) ->AvatarBuilderUI
    func cornerRadius (radius: CGFloat) ->AvatarBuilderUI
}
