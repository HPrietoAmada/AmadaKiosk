//
//  CalendarCollectionViewController+Protocols.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/16/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension CalendarCollectionViewController: CalendarCollectionViewDelegate {
    func calendarCollectionView(_ view: CalendarCollectionView, didSelect date: Date, tag: Int) {
        print("CalendarCollectionViewController: \(date.toString())")
    }
}
