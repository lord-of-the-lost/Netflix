//
//  NetworkLayer.swift
//  Netflix
//
//  Created by Николай Игнатов on 07.02.2023.
//

import Foundation

final class NetworkLayer {
    
    static let shared = NetworkLayer()
    
    func getTrandingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.apiKey)") else { return }
        
        getAndDecodeData(url: url, completion: completion)
    }
    
    func getTrandingTV(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.apiKey)") else { return }
        
        getAndDecodeData(url: url, completion: completion)
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.apiKey)&language=en-US&page=1") else { return }
        
        getAndDecodeData(url: url, completion: completion)
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1") else { return }
        
        getAndDecodeData(url: url, completion: completion)
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.apiKey)&language=en-US&page=1") else { return }
        
        getAndDecodeData(url: url, completion: completion)
        
    }
    
    private func getAndDecodeData(url: URL, completion: @escaping (Result<[Title], Error>) -> Void) {

        let _ = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(ApiError.failedToGetData))
            }
        } .resume()
    }
   
}

struct Constants {
    static let apiKey = "697d439ac993538da4e3e60b54e762cd"
    static let baseURL = "https://api.themoviedb.org"
}

enum ApiError: Error {
    case failedToGetData
}
