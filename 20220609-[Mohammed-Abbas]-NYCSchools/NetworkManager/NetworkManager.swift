//
//  NetworkManager.swift
//  20220609-[Mohammed-Abbas]-NYCSchools
//
//  Created by Field Employee on 6/10/22.
//

import Foundation

// creating cases to catch errors while fetching the URL and or Data
enum NetworkError: Error {
    case badURL
    case badData
}

// descriptions of the errors in a simple and easy to use switch statment
extension NetworkError: LocalizedError {
    public var description: String? {
        switch self {
        case .badURL:
            return NSLocalizedString("Bad URL", comment: "Bad URL")
        case .badData:
            return NSLocalizedString("Bad Data", comment: "Bad Data")
        }
    }
}

// get data function will call get list which calls the network manager to fill the array with what response we get from JSON from URL endpoints
protocol GetData {
    func getList(url: URL?, completion: @escaping (Result<Welcome, Error>) -> Void)
}

class NetworkManager {
    let session: URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

// the network manager will use a closure to make sure we get data from the correct url, if we do we put in the array 'data' and if not we will return the error
extension NetworkManager: GetData {
    func getList(url: URL?, completion: @escaping (Result<Welcome, Error>) -> Void){
        guard let url = url else {
            completion(.failure(NetworkError.badURL))
            return
        }
        self.session.dataTask(with: url){ data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
            do {
                let model = try JSONDecoder().decode(Welcome.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
