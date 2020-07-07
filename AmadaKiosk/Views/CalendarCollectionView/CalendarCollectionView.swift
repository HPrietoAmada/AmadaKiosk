//
//  CalendarCollectionView.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/15/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

protocol CalendarCollectionViewDelegate {
    func calendarCollectionView(_ view: CalendarCollectionView, didSelect date: Date, tag: Int)
}

class CalendarCollectionView: UICollectionView {

    var _calendarCollectionViewDelegate: CalendarCollectionViewDelegate?

    let cellId: String = "calendar-view-controller-collectionview-cell"
    let headerId: String = "calendar-view-controller-collectionview-header"

    var titleFont: UIFont? = UIFont(name: UIFont.FontNames.demiBold, size: 24)
    var font: UIFont? = UIFont(name: UIFont.FontNames.demiBold, size: 18)

    var date: Date = Date() {
        didSet {
            let monthDays: [Date] = date.getDays()
            if let firstDay = monthDays.first {
                let weekDay = Calendar.current.component(.weekday, from: firstDay)
                beginningOfMonthSkipDays = weekDay - 1
            }
            days = monthDays
            reloadData()
        }
    }

    var beginningOfMonthSkipDays: Int = 0 {
        didSet {

        }
    }

    var days: [Date] = [Date]() {
        didSet {
        }
    }

    private func setup() {
        backgroundColor = .clear
        date = Date()
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        dataSource = self
        register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        register(CalendarCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
