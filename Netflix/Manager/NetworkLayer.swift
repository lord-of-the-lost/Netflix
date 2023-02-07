//
//  NetworkLayer.swift
//  Netflix
//
//  Created by Николай Игнатов on 07.02.2023.
//

import Foundation

final class NetworkLayer {
    static let shared = NetworkLayer()
    
    func getTrandingMovies(complition: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(ApiError.failedToGetData))
            }
        } .resume()
    }
    
    func getTrandingTV(complition: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/tv/day?api_key=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(ApiError.failedToGetData))
            }
        } .resume()
    }
    
    func getupcomingMovies(complition: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.apiKey)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(ApiError.failedToGetData))
            }
        } .resume()
    }
    
    func getPopular(complition: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(ApiError.failedToGetData))
            }
        } .resume()
    }
    
    func getTopRated(complition: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.apiKey)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrandingTitleResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(ApiError.failedToGetData))
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
