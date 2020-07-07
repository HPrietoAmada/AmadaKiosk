//
//  Border.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/15/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

class Border: UIView {

    private var heightLayoutConstraint: NSLayoutConstraint?

    var _height: CGFloat = 0.75 {
        didSet {
            heightLayoutConstraint?.constant = _height
        }
    }

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)

        backgroundColor = .placeholder
        translatesAutoresizingMaskIntoConstraints = false
        heightLayoutConstraint = heightAnchor.constraint(equalToConstant: _height)
        heightLayoutConstraint?.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
