//
//  FavouritesDetailViewController.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit

class FavouritesDetailViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var genresLabel: UILabel!
    
    private var viewModel = FavouritesListViewModel()
    
    var movieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.movieDetail.bind { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
        
        guard let movieId = movieId else { return }
        viewModel.fetchMovies(movieId: movieId) { movieDetail in
            self.viewModel.movieDetail.value = FavouritesTableViewCellViewModel(movieDetail: movieDetail)
        }
    }
    
    private func updateUI() {
        let detail = viewModel.movieDetail.value?.movieDetail
        titleLabel.text = detail?.title
        
        let genres = detail?.genres?.compactMap { $0.name } ?? []
        genresLabel.text = genres.joined(separator: ", ")
    }

}
