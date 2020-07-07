//
//  CalendarCollectionViewCell.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/15/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {

    var isBlankCell: Bool = false {
        didSet {
            view.alpha = isBlankCell ? 0 : 1
            isUserInteractionEnabled = !isBlankCell
        }
    }

    override var isUserInteractionEnabled: Bool {
        didSet {

        }
    }

    var padding: CGFloat = 10 {
        didSet {

        }
    }

    var font: UIFont? = UIFont(name: UIFont.FontNames.demiBold, size: 18) {
        didSet {
            label.font = font
        }
    }

    var _date: Date? {
        didSet {
            guard let date = _date else { return }
            label.text = "\(date.dayMonthYear().0)"

            if !isSelected {
                label.textColor = date >= Date() ? _primaryTextColor : _secondaryTextColor
                view.layer.borderColor = date == Date() ? _borderColor.cgColor : UIColor.clear.cgColor
            }
        }
    }

    var _borderColor: UIColor = UIColor._primary {
        didSet {
            view.layer.borderColor = _borderColor.cgColor
        }
    }

    var _cornerRadius: CGFloat = 30 {
        didSet {
            view.layer.cornerRadius = _cornerRadius
        }
    }

    var _primaryTextColor: UIColor = ._black {
        didSet {

        }
    }

    var _secondaryTextColor: UIColor = ._gray

    override var isSelected: Bool {
        didSet {
            if isSelected {
                view.backgroundColor = ._secondary
                label.textColor = .white
                view.layer.borderColor = UIColor._secondary.cgColor
            } else {
                view.backgroundColor = .clear
                if let date = _date {
                    label.textColor = date >= Date() ? _primaryTextColor : _secondaryTextColor
                    view.layer.borderColor = date == Date() ? _borderColor.cgColor : UIColor.clear.cgColor
                }
            }
        }
    }

    let view: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.clear.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let label: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: UIFont.FontNames.demiBold, size: 16)
        view.backgroundColor = .clear
        view.textColor = ._black
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private func setup() {
        backgroundColor = .clear

        contentView.addSubview(view)
        view.addSubview(label)

        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding).isActive = true
        view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding).isActive = true
        view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding).isActive = true

        label.textColor = _primaryTextColor
        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
