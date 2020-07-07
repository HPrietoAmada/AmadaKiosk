//
//  CalendarCollectionView+Protocols.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/16/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension CalendarCollectionView: CalendarCollectionViewHeaderDelegate {
    func calendarCollectionViewHeader(_ view: CalendarCollectionViewHeader, prevButtonClicked tag: Int) {
        guard let prevMonth: Date = date.getAddMonth(-1) else { return }
        self.date = prevMonth
    }

    func calendarCollectionViewHeader(_ view: CalendarCollectionViewHeader, nextButtonClicked tag: Int) {
        guard let nextMonth: Date = date.getAddMonth(1) else { return }
        self.date = nextMonth
    }
}
