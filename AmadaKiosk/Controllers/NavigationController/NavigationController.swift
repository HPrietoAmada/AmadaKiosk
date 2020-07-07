//
//  NavigationController.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/5/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

public class NavigationController: UINavigationController, UINavigationBarDelegate {

    override public func viewDidLoad() {
        setup()
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setup() {

        navigationBar.isHidden = false
        navigationBar.backgroundColor = ._secondary
        //navigationBar.isTranslucent = false
        navigationBar.tintColor = isDarkMode() ? .white : .black
        navigationBar.addShadow(1, ._secondary)
        navigationBar.barStyle = .black
        UINavigationBar.appearance().barTintColor = ._secondary
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor._secondary]
    }
}
