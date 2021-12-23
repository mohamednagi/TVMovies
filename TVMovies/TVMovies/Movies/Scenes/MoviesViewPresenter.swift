//
//  MoviesViewPresenter.swift
//  TVMovies
//
//  Created by Nagiz on 23/12/2021.
//

import Foundation

protocol MoviesViewPresenter {
    var numberOfMovies: Int {get}
    func configureMovieCell(cell: MoviesTableView, index: Int)
}

class MoviesViewPresenterImplementation: MoviesViewPresenter {
    
    // MARK: - Variables
    
    var moviesArray = [MoviesData]()
    var numberOfMovies: Int {
        return moviesArray.count
    }
    private weak var view: MoviesView!
    
    init(view: MoviesView) {
        self.view = view
    }
    
    
    // MARK: - Functions
    
    func getMovies() {
        
    }
    
    func configureMovieCell(cell: MoviesTableView, index: Int) {
        let row = moviesArray[index]
        let movie = row.show
        cell.display(name: movie.name)
        cell.display(rate: movie.rating.average)
        cell.display(link: movie.url)
        cell.display(image: movie.image.original)
        cell.display(premiered: movie.premiered)
        cell.display(runTime: movie.runtime)
    }
    
    
}
