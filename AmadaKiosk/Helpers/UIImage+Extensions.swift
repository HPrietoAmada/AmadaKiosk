//
//  UIImage+Extensions.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/8/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

fileprivate var imageCache: NSCache<NSString, UIImage> = NSCache<NSString, UIImage>();

extension UIImageView {
    
    func download(from urlString: String) {

        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        guard let url = URL(string: urlString) else {
            return
        }

        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url), let newImage = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                imageCache.setObject(newImage, forKey: urlString as NSString)
                self.image = newImage
            }
        }
    }

}

extension UIImage {

    static let _next: UIImage? = UIImage(named: "next")?.withRenderingMode(.alwaysTemplate)
    static let _prev: UIImage? = UIImage(named: "prev")?.withRenderingMode(.alwaysTemplate)
}
