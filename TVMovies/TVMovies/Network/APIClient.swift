//
//  APIClient.swift
//  TVMovies
//
//  Created by Nagiz on 23/12/2021.
//

import UIKit

class APIClient {
    
    class func fetchJson<T: Codable>(stringURL:String,completion: @escaping (((Result<T,Error>)?) -> Void)) {
        guard let url = URL(string: stringURL) else {return}
        let session = URLSession.shared
        let request = URLRequest(url: url)
        session.dataTask(with: request) {data,_,error in
            guard error == nil else {
                completion(nil)
                return}
            guard let data = data else {
                completion(nil)
                return}
            DispatchQueue.main.async {
                do {
                    let myModel = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(myModel))
                }catch {
                    completion(.failure(error))
                }
            }
            
            
        }.resume()
    }
    
    class func downloadImage(from url: URL, completion: @escaping(UIImage?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }.resume()
    }
}
