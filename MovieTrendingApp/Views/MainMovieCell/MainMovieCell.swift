//
//  MainMovieCell.swift
//  MovieTrendingApp
//
//  Created by cumulations on 06/06/23.
//
import Foundation
import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    public static var identifier: String{
        get{
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib{
        UINib(nibName: "MainMovieCell", bundle: nil)
    }

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.round()
        backView.addBorder(color: UIColor.label, width: 1)
        movieImageView.round(5)
        backView.backgroundColor = .lightGray
    }
    
    func setupCell(viewModel: MovieTableCellViewModel){
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.ratingLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
}
