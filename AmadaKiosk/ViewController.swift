//
//  ViewController.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/5/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var statusView: MachineStatusView = {
        return MachineStatusView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initSubViews()
    }

    private func initSubViews() {
        view.addSubview(statusView)

        statusView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        statusView.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        statusView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        statusView.heightAnchor.constraint(equalToConstant: statusView.frame.width * (6/9)).isActive = true
    }


}

