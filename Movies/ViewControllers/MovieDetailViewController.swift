//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var posterImage: UIImageView!
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    var movie: MovieResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setupUI()
    }
    
    private func setupUI() {
        guard let movie = movie else { return }
        if let path = movie.posterPath {
            posterImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(path)"))
        } else {
            posterImage.image = UIImage(named: "noImageFound")
        }
        descriptionLabel.text = movie.overview
        dateLabel.text = movie.releaseDate
    }
}
