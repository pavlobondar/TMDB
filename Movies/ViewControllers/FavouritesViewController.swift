//
//  FavouritesViewController.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private var movies: [MovieTableViewCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "FavoriteCell", bundle: nil), forCellReuseIdentifier: FavoriteCell.identifier)
        
        self.view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Favourites"
        
        let navController = self.tabBarController?.viewControllers![0] as! UINavigationController
        let vc = navController.topViewController as! ListViewController
        vc.addMovie = { movie in
            guard let movie = movie else { return }
            self.movies.append(movie)
        }
        
        setupTableViewConstraints()
        tableView.reloadData()
    }

    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension FavouritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifier, for: indexPath) as! FavoriteCell
        cell.movie = movies[indexPath.row].movie
        return cell
    }
}

extension FavouritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.tableView.beginUpdates()
            self.movies.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC: FavouritesDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavouritesDetailViewController") as! FavouritesDetailViewController
        detailVC.movieId = movies[indexPath.row].movie.id
        self.present(detailVC, animated: true)
    }
}
