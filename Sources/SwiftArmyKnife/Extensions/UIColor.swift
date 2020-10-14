import Foundation
import UIKit

extension UIColor {
    convenience init!(red: Int, green: Int, blue: Int, alpha: Int = 255) {
        guard red >= 0 && red <= 255,
            green >= 0 && green <= 255,
            blue >= 0 && blue <= 255,
            alpha >= 0 && alpha <= 255 else {
                return nil
        }
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
    convenience init!(rgb: Int) {
        guard rgb >= 0 && rgb <= 0xFFFFFF else {
            return nil
        }
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    convenience init!(rgba: Int) {
        guard rgba >= 0 && rgba <= 0xFFFFFFFF else {
            return nil
        }
        self.init(
            red: (rgba >> 24) & 0xFF,
            green: (rgba >> 16) & 0xFF,
            blue: (rgba >> 8) & 0xFF,
            alpha: rgba & 0xFF
        )
    }
    
    convenience init!(hexCode: String?) {
        guard let hexCode = hexCode else {
            return nil
        }
        let hex: String
        if (hexCode.starts(with: "#")) {
            hex = hexCode[1...]
        } else {
            return nil
        }
        guard let int = Int(hex, radix: 16) else {
            return nil
        }
        if (hex.count == 8) {
            self.init(rgba: int)
        } else if (hex.count == 6) {
            self.init(rgb: int)
        } else {
            return nil
        }
    }
}
