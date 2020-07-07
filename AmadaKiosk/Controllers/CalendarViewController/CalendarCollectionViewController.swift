//
//  CalendarViewController.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/10/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

class CalendarCollectionViewController: UIViewController {

    var collectionView: CalendarCollectionView? = {
        let view: CalendarCollectionView? = CalendarCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func setup() {
        view.backgroundColor = .white
        view.addSubview(collectionView!)

        collectionView?._calendarCollectionViewDelegate = self
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView?.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView?.rightAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
