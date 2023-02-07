//
//  NetworkLayer.swift
//  Netflix
//
//  Created by Николай Игнатов on 07.02.2023.
//

import Foundation

struct Constants {
    static let apiKey = "697d439ac993538da4e3e60b54e762cd"
    static let baseURL = "https://api.themoviedb.org"
}

final class NetworkLayer {
    static let shared = NetworkLayer()
    
    func getTrandingMovies(complition: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrandingMoviesResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(error))
            }
        } .resume()
    }
   
}



//let url = "https://api.themoviedb.org/3/trending/all/day?api_key=697d439ac993538da4e3e60b54e762cd"
