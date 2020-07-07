//
//  TapCollectionViewCell.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/5/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

class TapCollectionViewCell: UICollectionViewCell {

    var image: UIImage? {
        didSet {
            imageView.image = image?.withRenderingMode(.alwaysTemplate)
        }
    }

    var text: String = "" {
        didSet {
            label.text = text
        }
    }

    var padding: CGFloat = 10
    var imagePadding: CGFloat = 25
    var labelHeight: CGFloat = 80
    var cellPadding: CGFloat = 10

    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 35
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var imageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.backgroundColor = .clear
        //view?.layer.borderWidth = 2
        //view?.layer.borderColor = UIColor.lightGray.cgColor
        view.tintColor = UIColor._primary
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var label: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont(name: UIFont.FontNames.medium, size: 21)
        view.textAlignment = .center
        view.textColor = ._black
        view.numberOfLines = 2
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    func setup() {
        contentView.addSubview(view)
        view.addSubview(imageView)
        view.addSubview(label)

        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: cellPadding).isActive = true
        view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -cellPadding).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -cellPadding).isActive = true
        view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: cellPadding).isActive = true
        view.addShadow(0.1)

        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: imagePadding).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(imagePadding + labelHeight)).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding).isActive = true
        label.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true

    }

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
