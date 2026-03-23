//
//  ImageCacher.swift
//  ShortsCaseStudy
//
//  Created by Kerem on 22.03.2026.
//

import Foundation
import SwiftUI

final class ImageCacher {
    static let shared = ImageCacher()
    
    private let cacheDirectory: URL
    private let fileManager = FileManager.default
    
    private init() {
        let paths = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        cacheDirectory = paths[0].appendingPathComponent("ImageCache")
        try? fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
    }
    
    private func fileName(for urlString: String) -> String {
        "\(abs(urlString.hashValue)).jpg"
    }
    
    func exists(for urlString: String) -> Bool {
        let fileURL = cacheDirectory.appendingPathComponent(fileName(for: urlString))
        return fileManager.fileExists(atPath: fileURL.path)
    }
    
    func getImage(for urlString: String) -> UIImage? {
        guard exists(for: urlString) else { return nil }
        let fileURL = cacheDirectory.appendingPathComponent(fileName(for: urlString))
        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        return UIImage(data: data)
    }
    
    func download(from urlString: String) async throws -> UIImage? {
        if let cached = getImage(for: urlString) {
            return cached
        }
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else { return nil }
        
        let fileURL = cacheDirectory.appendingPathComponent(fileName(for: urlString))
        try? data.write(to: fileURL)
        
        return image
    }
    
    func clearCache() {
        try? fileManager.removeItem(at: cacheDirectory)
        try? fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
    }
}
