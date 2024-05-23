//
//  DetailViewController.swift
//  themoviewDbMVVMSwiftUikits
//
//  Created by Sergio Luis Noriega Pita on 23/05/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var descriptionMovie: UILabel!
    
    @IBOutlet weak var labelAverague: UILabel!
    @IBOutlet weak var labelLenguague: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = movie else {
            return
        }
        titleMovie.text = movie.title
        // Load image from URL
        if let posterPath = movie.posterPath, let url = APIManager.shared.getImageURL(path: posterPath) {
            URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imageMovie.image = image
                    }
                }
            }.resume()
        }
        descriptionMovie.text = movie.overview
        labelAverague.text = "Average: \(movie.voteAverage)"
        labelLenguague.text = "Language: \(movie.originalLanguage)"
    }
}
