//
//  NewsApi.swift
//  NewsApp
//
//  Created by ビジャイクマール デックシット ディッバダハッリ on 2023/02/24.
//

import Foundation

final class NewsApi{
    static let shared = NewsApi()
    
    struct Constants{
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=6443fe79e06d44b89c7524180081795e")
        
        static let searchURL = "https://newsapi.org/v2/everything?from=2023-02-23&to=2023-02-23&sortBy=popularity&apiKey=6443fe79e06d44b89c7524180081795e&q="
    }
    
    init() {}
    
    // Top stories
    public func getTopHeadlines(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = Constants.topHeadlinesURL else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error{
                completion(.failure(error))
            }
            else if let data = data{
                do{
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                }
                catch{
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    // search news with string
    public func searchNewsArticle(with query: String, completion: @escaping (Result<[Article], Error>) -> Void){
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else{ return }
        
        let urlString = Constants.searchURL + query
        guard let url = URL(string: urlString) else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error{
                completion(.failure(error))
            }
            else if let data = data{
                do{
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles:", result.articles.count)
                    completion(.success(result.articles))
                }
                catch{
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

