//
//  PopularTableViewCell.swift
//  periferiaTheMoviesDBSwift
//
//  Created by Sergio Luis Noriega Pita on 20/05/24.
//

import UIKit
import Combine

class PopularTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var averagueMovie: UILabel!
    
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie) {
        titleMovie.text = movie.title
        averagueMovie.text = "Average: \(movie.voteAverage)"
        
        if let posterPath = movie.posterPath, let url = APIManager.shared.getImageURL(path: posterPath) {
            cancellable = imageLoader.$image.sink { [weak self] image in
                self?.imageMovie.image = image
            }
            imageLoader.loadImage(from: url)
        }
    }
    
}
