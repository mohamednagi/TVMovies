//
//  MovieDetailsViewController.swift
//  TVMovies
//
//  Created by Nagiz on 23/12/2021.
//

import UIKit

class MovieDetailsViewController: BaseView {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    
    // MARK: - Variables
    
    var currentMovie: MovieData?

    override func viewDidLoad() {
        super.viewDidLoad()
        setData(data: currentMovie)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.isNavigationBarHidden = false
    }
    

    // MARK: - Functions
    
    func setData(data: MovieData?) {
        guard let show = data else {
            navigationController?.popViewController(animated: true)
            return
        }
        
        movieName.text = show.show.name
        guard let url = URL(string: show.show.image.original) else {return}
        APIClient.downloadImage(from: url) {[weak self] image in
            guard let `self` = self else {return}
            self.movieImage.image = image ?? UIImage()
        }
    }

}
