//
//  Constants.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//

import Foundation
import UIKit
struct K {
    struct Strings {
        static let branchCleaningTitle = "¿Estaba limpia la sucursal?"
        static let securityCellTitle = "¿Qué empresas cuentan con medidas de seguridad?"
        static let selfieCellTitle = "Selfie"
    }
    struct Colors {
        static let titleColor = #colorLiteral(red: 0.1274846287, green: 0.1373427848, blue: 0.1511366539, alpha: 1)
    }
    struct Numbers {
        static let titleFontSize = 22
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
