//
//  Movie.swift
//  Netflix
//
//  Created by Николай Игнатов on 07.02.2023.
//

import Foundation

struct TrandingMoviesResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double    
}
