//
//  Date+Extension.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/10/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension Date {

    init(month: Int, year: Int) {
        self.init()
        let dateComponents = DateComponents(year: year, month: month)
        self = Calendar.current.date(from: dateComponents)!
    }

    mutating func addDay(_ value: Int = 1) {
        self = Calendar.current.date(byAdding: .day, value: value, to: self)!
    }

    func getAddMonth(_ value: Int = 1) -> Date? {
        return Calendar.current.date(byAdding: .month, value: value, to: self)
    }

    func getAddDay(_ value: Int = 1) -> Date? {
        return Calendar.current.date(byAdding: .day, value: value, to: self)
    }

    func dayMonthYear() -> (Int, Int, Int) {
        return (
            Calendar.current.component(.day, from: self),
            Calendar.current.component(.month, from: self),
            Calendar.current.component(.year, from: self)
        )
    }

    func firstDayOf(month: Int, _ year: Int) -> Date? {
        let dateComponents = DateComponents(year: year, month: month)
        return Calendar.current.date(from: dateComponents)
    }

    func getDaysIn(month: Int, _ year: Int) -> [Date] {
        var days: [Date] = [Date]()
        guard var day: Date = Date().firstDayOf(month: month, year),
            let range = Calendar.current.range(of: .day, in: .month, for: day) else {
            return []
        }
        for _ in 1...range.count {
            days.append(day)
            day.addDay()
        }
        return days
    }

    func getDays() -> [Date] {
        let dayMonthYear = self.dayMonthYear()
        return getDaysIn(month: dayMonthYear.1, dayMonthYear.2)
    }

    static public func ==(lhs: Date, rhs: Date) -> Bool {
        let l = lhs.dayMonthYear()
        let r = rhs.dayMonthYear()
        return l.0 == r.0 && l.1 == r.1 && l.2 == r.2
    }

    static public func <(lhs: Date, rhs: Date) -> Bool {
        return lhs.compare(rhs) == .orderedAscending
    }

    static public func >(lhs: Date, rhs: Date) -> Bool {
        return lhs.compare(rhs) == .orderedDescending
    }

    static public func <=(lhs: Date, rhs: Date) -> Bool {
        let l = lhs.dayMonthYear()
        let r = rhs.dayMonthYear()
        return (l.0 == r.0 && l.1 == r.1 && l.2 == r.2) || (lhs.compare(rhs) == .orderedAscending)
    }

    static public func >=(lhs: Date, rhs: Date) -> Bool {
        let l = lhs.dayMonthYear()
        let r = rhs.dayMonthYear()
        return (l.0 == r.0 && l.1 == r.1 && l.2 == r.2) || (lhs.compare(rhs) == .orderedDescending)
    }

    func toString(_ format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
