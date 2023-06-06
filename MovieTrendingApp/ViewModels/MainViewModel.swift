//
//  MainViewModel.swift
//  MovieTrendingApp
//
//  Created by cumulations on 06/06/23.
//

import Foundation
import UIKit

class MainViewModel{
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int{
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int{
        return self.dataSource?.results.count ?? 0
    }
    
    func getData(){
        
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            switch result{
            case .success(let data):
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData(){
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieName(_ movie: Movie) -> String{
        return movie.title ?? movie.name ?? ""
    }
    
    func retriveMovie(with id: Int) -> Movie?{
        guard let movie = dataSource?.results.first(where: { movie in
            movie.id == id
        }) else{
            return nil
        }
        return movie
    }
}
