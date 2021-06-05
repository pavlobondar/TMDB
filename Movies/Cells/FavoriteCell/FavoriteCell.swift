//
//  FavoriteCell.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit
import SDWebImage

class FavoriteCell: UITableViewCell {
    static let identifier: String = "favoriteCell"
    
    @IBOutlet private weak var poster: UIImageView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var movie: MovieResult? {
        didSet {
            guard movie != nil else { return }
            setupUI()
        }
    }
    
    private func setupUI() {
        guard let movie = movie else { return }
        
        if let path = movie.posterPath {
            poster.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(path)"))
        } else {
            poster.image = UIImage(named: "noImageFound")
        }
        titleLabel.text = movie.originalTitle
        descriptionLabel.text = movie.overview
        self.selectionStyle = .none
    }
}
