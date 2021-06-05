//
//  APIService.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import Foundation

class APIService {
    
    func fetchData<T: Codable>(url: URL?, completion : @escaping (T) -> ()) {
        guard let url = url else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            do {
                let movieModels = try JSONDecoder().decode(T.self, from: data)
                completion(movieModels)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        .resume()
    }
}
