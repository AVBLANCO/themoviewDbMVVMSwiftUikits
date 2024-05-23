//
//  ImageLoader.swift
//  periferiaTheMoviesDBSwift
//
//  Created by Sergio Luis Noriega Pita on 20/05/24.
//

import Foundation
import Combine
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var error: Error?
    
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.error = error
                }
                return
            }
            guard let data = data, let loadedImage = UIImage(data: data) else {
                DispatchQueue.main.async {
                    self.error = NSError(domain: "com.example.ImageLoader", code: -1,
                                         userInfo: [NSLocalizedDescriptionKey: "No data received"])
                }
                return
            }
            DispatchQueue.main.async {
                self.image = loadedImage
            }
        }.resume()
    }
}
