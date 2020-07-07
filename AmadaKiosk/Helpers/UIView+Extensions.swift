//
//  UIView+Extensions.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/5/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension UIView {

    func inDarkMode() -> Bool {
        return traitCollection.userInterfaceStyle == .dark
    }

    func addShadow(_ opacity: Float = 0.1, _ shadowColor: UIColor = ._black) {
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = self.layer.cornerRadius / 3
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowColor = shadowColor.cgColor
    }
}
