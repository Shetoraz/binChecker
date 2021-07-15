//
//  BinCheckerService.swift
//  binChecker
//
//  Created by Anton on 11.07.21.
//

import Foundation

class BinCheckerService {
    
    func checkBin(_ bin: String, completionHandler: @escaping (Result<Bank, Error>) -> Void) {
        guard let url = URL(string: "https://lookup.binlist.net/\(bin)") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let reponse = try JSONDecoder().decode(Bank.self, from: data)
                completionHandler(.success(reponse))
            } catch let error {
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
}
