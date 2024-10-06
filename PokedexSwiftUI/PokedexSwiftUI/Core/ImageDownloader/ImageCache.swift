//
//  ImageCache.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import UIKit

final class DownloadedImageCache {
    var cache = NSCache<NSString, UIImage>()

    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }

    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension DownloadedImageCache {
    private static var imageCache = DownloadedImageCache()

    static func getImageCache() -> DownloadedImageCache {
        return imageCache
    }
}
