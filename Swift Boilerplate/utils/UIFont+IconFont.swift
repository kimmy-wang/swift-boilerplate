//
//  UIFont+IconFont.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import Foundation
import UIKit

/// Font扩展
public extension UIFont {
    /// 初始化：iconFont
    class func iconfont(ofSize: CGFloat) -> UIFont? {
    // iconFont,对应我们导入的名字，size,就是图标大小
        return UIFont.init(name: "iconFont", size: ofSize)
    }
}

public enum Iconfont: String {
   // Tabbar Icon
    case tabHome = "\u{e600}"
    case tabHomeSelected = "\u{e601}"
    case tabMine = "\u{e602}"
    case tabMineSelected = "\u{e603}"
    case scanning = "\u{e604}"
    case settings = "\u{e605}"
}

public extension UILabel {

    class func iconFont(from iconFont: Iconfont, size: CGFloat = 25, textColor: UIColor = .black) -> UILabel {
        let label = UILabel.init()
        label.text = iconFont.rawValue
        label.textAlignment = .center
        label.font = UIFont.iconfont(ofSize: size)
        label.textColor = textColor
        return label
    }
}

public extension UIImage {
    convenience init(from font: Iconfont, textColor: UIColor = .black, backgroundColor: UIColor = .clear, size: CGSize) {
        let drawText = font
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center

        let fontSize = min(size.width / 1.28571429, size.height)
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.iconfont(ofSize: fontSize), .foregroundColor: textColor, .backgroundColor: backgroundColor, .paragraphStyle: paragraphStyle]

        let attributedString = NSAttributedString(string: drawText.rawValue, attributes: attributes)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) * 0.5, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if let image = image {
            self.init(cgImage: image.cgImage!, scale: image.scale, orientation: image.imageOrientation)
        } else {
            self.init()
        }
    }

    static func icon(from font: Iconfont, iconColor: UIColor, imageSize: CGSize, ofSize size: CGFloat) -> UIImage {
        let drawText = font.rawValue

        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center

        drawText.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height), withAttributes: [.font: UIFont.iconfont(ofSize: size), .paragraphStyle: paragraphStyle, .foregroundColor: iconColor])

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image!
    }
}
