//
//  NetworkConstant.swift
//  MovieTrendingApp
//
//  Created by cumulations on 06/06/23.
//

import Foundation
class NetworkConstant{
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init(){
        
    }
    
    public var apiKey: String{
        get{
             return "addYourOwnKey"
        }
    }
    
    public var serverAddress: String{
        get{
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String{
        get{
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
