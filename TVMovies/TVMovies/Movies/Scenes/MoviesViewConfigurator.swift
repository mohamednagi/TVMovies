//
//  MoviesViewConfiguratorImplementation.swift
//  TVMovies
//
//  Created by Nagiz on 23/12/2021.
//

import Foundation

class MoviesViewConfiguratorImplementation: BaseViewConfigurator {
    func configure<T>(view: T) {
        guard let view = view as? MoviesViewController else {return}
        let presenter = MoviesViewPresenterImplementation(view: view)
        view.presenter = presenter
    }
}
