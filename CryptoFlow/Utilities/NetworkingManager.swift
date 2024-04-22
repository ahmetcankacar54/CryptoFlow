//
//  NetworkingManager.swift
//  CryptoFlow
//
//  Created by Ahmet Kaçar on 22.04.2024.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum DownloadRequest {
        case url(URL)
        case urlRequest(URLRequest)
    }
    
    enum NetworkingError: LocalizedError {
        case badUrlResponse(url: URL)
        case badRequestResponse(request: URLRequest)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badUrlResponse(let url):
                return "[⛔️] Bad response from the URL. \(url)"
            case .badRequestResponse(let request):
                return "[✴️] Bad response from the Request. \(request)"
            case .unknown:
                return "[⚠️] Unkown error occured."
            }
        }
        
    }

    
    static func download(request: DownloadRequest) -> AnyPublisher<Data, Error> { 
        switch request {
            
        case let .url(url):
            return URLSession.shared.dataTaskPublisher(for: url)
                 .subscribe(on: DispatchQueue.global(qos: .default))
                 .tryMap({try handleOutput(output: $0, url: .url(url))})
                 .receive(on: DispatchQueue.main)
                 .eraseToAnyPublisher()
        case let .urlRequest(url):
            return URLSession.shared.dataTaskPublisher(for: url)
                 .subscribe(on: DispatchQueue.global(qos: .default))
                 .tryMap({try handleOutput(output: $0, url: .urlRequest(url))})
                 .receive(on: DispatchQueue.main)
                 .eraseToAnyPublisher()
        }
        
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .failure(let error):
            print("Error Downloading Data! \(error)")
        case .finished:
            break
        }
    }
    
    static func handleOutput(output: URLSession.DataTaskPublisher.Output, url: DownloadRequest) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            switch url {
            case let .url(url):
                throw NetworkingError.badUrlResponse(url: url)
            case let .urlRequest(url):
                throw NetworkingError.badRequestResponse(request: url)
            }
            
        }
        
        return output.data
    }
       
}




