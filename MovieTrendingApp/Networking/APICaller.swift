//
//  APICaller.swift
//  MovieTrendingApp
//
//  Created by cumulations on 06/06/23.
//

import Foundation

public class APICaller{
    
    enum NetworkError: Error{
        case urlError
        case canNotParseData
    }
    static func getTrendingMovies(
        completionHandler: @escaping (_ result: Result<TrendingMoviesModel,Error>)
        ->Void){
            let urlString = NetworkConstant.shared.serverAddress + "trending/all/week?api_key=" + NetworkConstant.shared.apiKey
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(NetworkError.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
                if error == nil, let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data){
                    completionHandler(.success(resultData))
                }else{
                    completionHandler(.failure(NetworkError.canNotParseData))
                }
            }.resume()
    }
}
