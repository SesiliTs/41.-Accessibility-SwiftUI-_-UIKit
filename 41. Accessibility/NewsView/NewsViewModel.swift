//
//  NewsViewModel.swift
//  41. Accessibility
//
//  Created by Sesili Tsikaridze on 27.12.23.
//

import Foundation
import NetworkManager

final class NewsViewModel: ObservableObject {
    
    @Published var news = [News]()

    // MARK: - Initialisation
    
    init() {
        fetchData()
    }
    
    // MARK: - Network Call
    func fetchData() {
        let url = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=RPh7SsqhZzUkxgOoEHLNMaA2hk1XcAnP"
        
        NetworkService.shared.getData(urlString: url) { [weak self] (result: Result<NewsData, Error>) in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                self.news = data.results
            case .failure(let error):
                print(error)
            }
        }
    }

    
}
