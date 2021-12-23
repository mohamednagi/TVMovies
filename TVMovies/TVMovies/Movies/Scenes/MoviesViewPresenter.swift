//
//  MoviesViewPresenter.swift
//  TVMovies
//
//  Created by Nagiz on 23/12/2021.
//

import Foundation

protocol MoviesViewPresenter {
    var numberOfMovies: Int {get}
    var moviesArray: [MovieData] {get}
    func configureMovieCell(cell: MoviesTableView, index: Int)
    func getMovies(completion: @escaping ()->Void)
}

class MoviesViewPresenterImplementation: MoviesViewPresenter {
    
    // MARK: - Variables
    
    var moviesArray = [MovieData]()
    var numberOfMovies: Int {
        return moviesArray.count
    }
    private weak var view: MoviesView!
    
    init(view: MoviesView) {
        self.view = view
    }
    
    
    // MARK: - Functions
    
    func getMovies(completion: @escaping ()->Void) {
        view.startLoading()
        APIClient.fetchJson(stringURL: URLS.showsURL) {[weak self] (result: Result<[MovieData],Error>?) in
            guard let `self` = self else {return}
            self.view.endLoading()
            switch result {
            case .success(let model):
                self.moviesArray = model
            case .failure(let error):
                print(error)
            case .none:
                print("No Data Found")
            }
            completion()
        }
    }
    
    func configureMovieCell(cell: MoviesTableView, index: Int) {
        let row = moviesArray[index]
        let movie = row.show
        cell.display(name: movie.name)
        cell.display(rate: movie.rating.average)
        cell.display(link: movie.url)
        cell.display(imageURL: movie.image.original)
        cell.display(premiered: movie.premiered)
        cell.display(runTime: movie.runtime)
    }
}
