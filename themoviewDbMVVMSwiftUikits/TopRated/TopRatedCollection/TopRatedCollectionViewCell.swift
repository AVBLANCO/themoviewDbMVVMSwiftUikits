//
//  TopRatedCollectionViewCell.swift
//  periferiaTheMoviesDBSwift
//
//  Created by Sergio Luis Noriega Pita on 20/05/24.
//

import UIKit
import Combine

class TopRatedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var nameMoview: UILabel!
    
    private var imageLoader = ImageLoader()
    private var cancellable: AnyCancellable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageMovie.image = nil
        cancellable?.cancel()
    }
    
    func configure(with movie: Movie) {
        nameMoview.text = movie.title
        debugPrint("Configuring cell for movie: \(movie.title)")
        
        if let posterPath = movie.posterPath, let url = APIManager.shared.getImageURL(path: posterPath) {
            cancellable = imageLoader.$image.sink { [weak self] image in
                self?.imageMovie.image = image
            }
            imageLoader.loadImage(from: url)
        }
    }
    
}
