//
//  BundleDecodable.swift
//  Moonshot
//
//  Created by Kamal Preet Singh on 2022-05-13.
//

import Foundation

extension Bundle {
    // Generic method for loading any kind of codable data
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to find \(file) file in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) file from bundle")
        }
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) file from bundle")
        }
        
        return loadedData
    }
}
