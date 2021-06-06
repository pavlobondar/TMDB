//
//  ViewController.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit
import SDWebImage

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cellIndexPath: IndexPath? {
        willSet {
            guard let indexPath = cellIndexPath else { return }
            if newValue != indexPath {
                let cell = tableView.cellForRow(at: indexPath)
                UIView.animate(withDuration: 0.5) {
                    cell?.alpha = 1
                }
            }
        }
    }
    
    var viewModel: MoviesListViewModel!
    var addMovie: ((_ movie: MovieTableViewCellViewModel?) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        longPress.minimumPressDuration = 0.2
        tableView.addGestureRecognizer(longPress)
        
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        
        viewModel.movies.bind { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        viewModel.fetchMovies { movieModels in
            self.viewModel.movies.value = movieModels.results?.compactMap({
                MovieTableViewCellViewModel(movie: $0)
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "List"
    }
    
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        
        switch sender.state {
        case .began: cellTapAnimation(sender: sender, alpha: 0.1)
        case .ended: cellTapAnimation(sender: sender, alpha: 1, movie: false)
        default: break
        }
    }

    private func cellTapAnimation(sender: UILongPressGestureRecognizer, alpha: CGFloat, movie: Bool = true) {
        
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        let touchPoint = sender.location(in: tableView)
        if let indexPath = tableView.indexPathForRow(at: touchPoint) {
            cellIndexPath = indexPath
            if movie { self.addMovie?(self.viewModel.movies.value?[indexPath.row]) }
            let cell = tableView.cellForRow(at: indexPath)
            UIView.animate(withDuration: 0.5) {
                cell?.alpha = alpha
            }
        }
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as! ListCell
        
        let movie = viewModel.movies.value?[indexPath.row].movie
        if let path = movie?.posterPath {
            cell.poster.sd_setImage(with: URL(string: viewModel.getImagePath(path: path)))
        } else {
            cell.poster.image = UIImage(named: "noImageFound")
        }
        cell.titleLabel.text = movie?.originalTitle
        cell.descriptionLabel.text = movie?.overview
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC: MovieDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        detailVC.movie = viewModel.movies.value?[indexPath.row].movie
        self.present(detailVC, animated: true)
    }
}
