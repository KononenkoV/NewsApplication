//
//  FontManager.swift
//  NewsApplication
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

enum FontManager: String {
    case mRegular = "Montserrat-Regular"
    case mBold = "Montserrat-Bold"
}

extension UIFont {
    static func montserrat(_ name: FontManager, _ size: CGFloat = 16) -> UIFont? {
        return UIFont(name: name.rawValue, size: size)
    }
}
