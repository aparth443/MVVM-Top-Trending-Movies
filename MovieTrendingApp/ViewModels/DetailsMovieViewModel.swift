//
//  DatailsMovieViewModel.swift
//  MovieTrendingApp
//
//  Created by cumulations on 06/06/23.
//

import Foundation
import UIKit

class DetailsMovieViewModel{
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieID = movie.id
        self.movieTitle = movie.name ?? movie.title ?? ""
        self.movieDescription = movie.overview
        self.movieImage = makeImageURL(movie.backdropPath)
    }
    
    func makeImageURL(_ imageCode: String ) -> URL?{
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
