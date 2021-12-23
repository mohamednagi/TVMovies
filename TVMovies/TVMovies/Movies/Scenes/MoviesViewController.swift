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
        setupTableView(with: "MoviesTableViewCell", tableView: moviesList)
    }

    // MARK: - Functions
    
    // MARK: - IBActions 

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
        
    }
}

