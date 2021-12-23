//
//  MoviesTableViewCell.swift
//  TVMovies
//
//  Created by Nagiz on 23/12/2021.
//

import UIKit

protocol MoviesTableView {
    func display(imageURL: String)
    func display(name: String)
    func display(rate: Int)
    func display(link: String)
    func display(runTime: Int)
    func display(premiered: String)
}

extension MoviesTableViewCell: MoviesTableView {
    
    func display(imageURL: String) {
        guard let url = URL(string: imageURL) else {return}
        APIClient.downloadImage(from: url) {[weak self] image in
            guard let `self` = self else {return}
            self.movieImage.image = image ?? UIImage()
        }
    }
    
    func display(name: String) {
        movieName.text = name
    }
    
    func display(rate: Int) {
        movieRate.text = "\(rate)"
    }
    
    func display(link: String) {
        movieLink.text = link
    }
    
    func display(runTime: Int) {
        movieRunTime.text = "\(runTime)"
    }
    
    func display(premiered: String) {
        moviePremiered.text = premiered
    }
    
}

class MoviesTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieLink: UILabel!
    @IBOutlet weak var movieRunTime: UILabel!
    @IBOutlet weak var moviePremiered: UILabel!
    
    
    // MARK: - Variables

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
