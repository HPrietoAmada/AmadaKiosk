//
//  CalendarCollectionView+CollectionView.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/15/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension CalendarCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count + beginningOfMonthSkipDays
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CalendarCollectionViewCell
        cell.isBlankCell = indexPath.row < beginningOfMonthSkipDays
        if indexPath.row < beginningOfMonthSkipDays {
        } else {
            let cellDate: Date = days[indexPath.row - beginningOfMonthSkipDays]
            cell._date = cellDate
            cell.font = self.font
            cell._cornerRadius = (getCellDims() - 20) / 2
            cell.isUserInteractionEnabled = cellDate >= Date()
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! CalendarCollectionViewHeader
            header.titleFont = titleFont
            header.weekdayLabelFont = font
            header.delegate = self

            let currentDate: Date = Date()
            header._prevButtonEnabled = date > currentDate
            header.date = date
            return header
        default:
            return UICollectionReusableView()
        }
    }

    private func getCellDims() -> CGFloat {
        let nDaysPerRow: CGFloat = 7
        let frameWidth: CGFloat = self.frame.width
        let cellDims: CGFloat = CGFloat(frameWidth - 40) / nDaysPerRow
        return cellDims
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: getCellDims(), height: getCellDims())
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedDate: Date = days[indexPath.row - beginningOfMonthSkipDays]
        _calendarCollectionViewDelegate?.calendarCollectionView(self, didSelect: selectedDate, tag: tag)
    }

}
