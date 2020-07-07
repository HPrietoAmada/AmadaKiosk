//
//  CalendarCollectionViewHeader.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/15/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

protocol CalendarCollectionViewHeaderDelegate {
    func calendarCollectionViewHeader(_ view: CalendarCollectionViewHeader, prevButtonClicked tag: Int)
    func calendarCollectionViewHeader(_ view: CalendarCollectionViewHeader, nextButtonClicked tag: Int)
}

class CalendarCollectionViewHeader: UICollectionReusableView {

    var delegate: CalendarCollectionViewHeaderDelegate?

    var weekdayLabelFont: UIFont? = UIFont(name: UIFont.FontNames.demiBold, size: 18) {
        didSet {
        }
    }

    var titleFont: UIFont? = UIFont(name: UIFont.FontNames.demiBold, size: 24) {
        didSet {
            titleLabel.font = titleFont
        }
    }
    
    var _prevButtonEnabled: Bool = true {
        didSet {
            prevButton.alpha = _prevButtonEnabled ? 1 : 0
        }
    }

    var _nextButtonEnabled: Bool = true {
        didSet {
            nextButton.alpha = _nextButtonEnabled ? 1 : 0
        }
    }

    var date: Date? {
        didSet {
            guard let date = date else { return }
            let dayMonthYear = date.dayMonthYear()
            let monthNames: [String] = Calendar.current.monthSymbols
            titleLabel.text = "\(monthNames[dayMonthYear.1 - 1]) \(dayMonthYear.2)"
        }
    }

    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var prevButton: UIButton = {
        let prev: UIImage = UIImage._prev!
        let view = UIButton()
        view.setBackgroundImage(prev, for: .normal)
        view.tintColor = .placeholder
        view.addTarget(self, action: #selector(handlePrevButtonClicked), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var nextButton: UIButton = {
        let next: UIImage = UIImage._next!
        let view = UIButton()
        view.setBackgroundImage(next, for: .normal)
        view.tintColor = .placeholder
        view.addTarget(self, action: #selector(handleNextButtonClicked), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "July"
        view.textAlignment = .center
        view.textColor = ._black
        view.font = UIFont(name: UIFont.FontNames.demiBold, size: 24)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let weekDayListStack: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let bottomBorder: Border = {
        return Border()
    }()

    @objc func handlePrevButtonClicked() {
        delegate?.calendarCollectionViewHeader(self, prevButtonClicked: tag)
    }

    @objc func handleNextButtonClicked() {
        delegate?.calendarCollectionViewHeader(self, nextButtonClicked: tag)
    }

    private func setup() {
        addSubview(view)

        view.addSubview(prevButton)
        view.addSubview(nextButton)
        view.addSubview(titleLabel)
        view.addSubview(weekDayListStack)
        view.addSubview(bottomBorder)

        let buttonPadding: CGFloat = 20

        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true

        weekDayListStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        weekDayListStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weekDayListStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weekDayListStack.heightAnchor.constraint(equalToConstant: 40).isActive = true

        prevButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        prevButton.bottomAnchor.constraint(equalTo: weekDayListStack.topAnchor, constant: -buttonPadding).isActive = true
        prevButton.topAnchor.constraint(equalTo: view.topAnchor, constant: buttonPadding).isActive = true
        prevButton.widthAnchor.constraint(equalTo: prevButton.heightAnchor).isActive = true

        titleLabel.bottomAnchor.constraint(equalTo: weekDayListStack.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: prevButton.rightAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: nextButton.leftAnchor).isActive = true

        nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        nextButton.topAnchor.constraint(equalTo: prevButton.topAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: prevButton.bottomAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalTo: prevButton.widthAnchor).isActive = true

        let weekdayNames: [String] = Calendar.current.veryShortWeekdaySymbols
        for weekday in weekdayNames {
            let label = UILabel()
            label.text = weekday
            label.textAlignment = .center
            label.backgroundColor = .clear
            label.font = weekdayLabelFont
            weekDayListStack.addArrangedSubview(label)
        }

        bottomBorder.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomBorder.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomBorder.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
