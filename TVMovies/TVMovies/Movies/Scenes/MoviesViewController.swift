//
//  ViewController.swift
//  TVMovies
//
//  Created by Nagiz on 23/12/2021.
//

import UIKit

protocol MoviesView: NSObjectProtocol {
    func startLoading()
    func endLoading()
}

class MoviesViewController: BaseView, MoviesView {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var moviesList: UITableView!
    
    
    
    // MARK: - Variables
    
    private var configurator: BaseViewConfigurator = MoviesViewConfiguratorImplementation()
    var presenter: MoviesViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(view: self)
        getMovies()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Functions
    
    func getMovies() {
        presenter.getMovies {[weak self] in
            guard let `self` = self else {return}
            self.setupTableView(with: "MoviesTableViewCell", tableView: self.moviesList)
        }
    }
    
    func navigateToMovieDetails(movie: MovieData) {
        guard let movieDetailsView = currentStoryboard(.MovieDetails).instantiateInitialViewController() as? MovieDetailsViewController else {return}
        movieDetailsView.currentMovie = movie
        navigationController?.pushViewController(movieDetailsView, animated: true)
    }
    
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfMovies
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as? MoviesTableViewCell else {return UITableViewCell()}
        presenter.configureMovieCell(cell: cell, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentMovie = presenter.moviesArray[indexPath.row]
        navigateToMovieDetails(movie: currentMovie)
    }
}

