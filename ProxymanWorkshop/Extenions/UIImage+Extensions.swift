//
//  UIImage+Extensions.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 21/04/2023.
//

import Foundation
import UIKit

extension UIImage {
    static func starImage(isFilled: Bool) -> UIImage? {
        let imageName = isFilled ? "star.fill" : "star"
        let image = UIImage(systemName: imageName)
        
        return image
    }
}
