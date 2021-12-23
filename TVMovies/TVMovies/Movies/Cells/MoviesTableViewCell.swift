//
//  MoviesTableViewCell.swift
//  TVMovies
//
//  Created by Nagiz on 23/12/2021.
//

import UIKit

protocol MoviesTableView {
    func display(image: String)
    func display(name: String)
    func display(rate: Int)
    func display(link: String)
    func display(runTime: String)
    func display(premiered: String)
}

extension MoviesTableViewCell: MoviesTableView {
    
    func downloadImage(from url: URL) -> UIImage {
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            DispatchQueue.main.async {
//                return UIImage(data: data)
//            }
//        }
        return UIImage()
    }
    
    func display(image: String) {
        guard let url = URL(string: image) else {return}
        movieImage.image = downloadImage(from: url)
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
    
    func display(runTime: String) {
        movieRunTime.text = runTime
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
