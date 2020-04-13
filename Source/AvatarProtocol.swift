//
//  AvatarProtocol.swift
//  builderPattern
//
//  Created by Hajji Anwer on 4/8/20.
//  Copyright © 2020 Hajji Anwer. All rights reserved.
//

import Foundation
import UIKit
public protocol AvatarBuilderUIProtocol {
    func circularView() -> AvatarBuilderUI
    func border(borderWidth : CGFloat, borderColor : CGColor) -> AvatarBuilderUI
    func shadow(opacity: Float, color:CGColor ) ->AvatarBuilderUI
    func scaleImage(url:String,scale:CGFloat) ->AvatarBuilderUI
    func backgroundColorWhenIsTransparant(url:String,color:UIColor) ->AvatarBuilderUI
    func cornerRadius (radius: CGFloat) ->AvatarBuilderUI
}
