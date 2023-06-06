//
//  MainViewController.swift
//  MovieTrendingApp
//
//  Created by cumulations on 06/06/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel : MainViewModel = MainViewModel()
    
    var cellDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.getData()
    }

    func configView(){
        self.title = "Trending Movies"
        self.view.backgroundColor = .systemBackground
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else{
                return
            }
            DispatchQueue.main.async {
                if isLoading{
                    self.activityIndicator.startAnimating()
                }else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else{
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetails(movieId: Int){
        guard let movie = viewModel.retriveMovie(with: movieId) else{
            return
        }
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsController = DetailsMovieViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
        
    }
   
}
