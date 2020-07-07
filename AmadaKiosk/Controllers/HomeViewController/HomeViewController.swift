//
//  HomeViewController.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/5/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

struct DirectoryModel: Codable {
    public var url: String?
    public var title: String?
    public var imagePath: String?
    public var imageName: String?

    enum CodingKeys: String, CodingKey {
        case url = "URL"
        case title = "TITLE"
        case imagePath = "IMAGE_PATH"
        case imageName = "IMAGE_NAME"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        imagePath = try values.decodeIfPresent(String.self, forKey: .imagePath)
        imageName = try values.decodeIfPresent(String.self, forKey: .imageName)
    }
}

class HomeViewController: UIViewController {

    var cellId: String = "home-tap-cell-id"

    var models: [DirectoryModel] = [DirectoryModel]() {
        didSet {
            collectionView.reloadData()
        }
    }

    lazy var collectionView: UICollectionView = {
        let view: UICollectionView = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        view.contentInset = UIEdgeInsets(
            top: 25,
            left: 0,
            bottom: 0,
            right: 0
        )
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var webViewController: WebViewController = {
        let controller: WebViewController = WebViewController()
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        fetchDirectories { (data, error) in
            guard let data = data else {
                self.presentAlert(title: "Error", message: error.localizedDescription)
                return
            }
            self.models = data
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    func fetchDirectories(_ completionHandler: @escaping DataReturned<[DirectoryModel]>) {
        DBManager.shared.get("directorymodel", completionHandler)
    }

    private func setup() {
        view.backgroundColor = ._lightGray
        view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TapCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.topAnchor.constraint(equalTo:view.topAnchor, constant: view.safeAreaInsets.top + 120).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.safeAreaInsets.bottom).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true

        let image: UIImage? = UIImage(named: "amada")
        let imageView: UIImageView = UIImageView(image: image)
        //imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Kiosk",
            style: .plain,
            target: nil,
            action: nil
        )
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: UIFont.FontNames.medium, size: 24)!
        ]
    }
}
