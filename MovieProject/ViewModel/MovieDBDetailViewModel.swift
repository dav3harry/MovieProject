//
//  MovieDBDetailViewModel.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import Moya
import Moya_ModelMapper
import RxCocoa
import RxSwift
import SwiftyJSON
import UIKit

class MovieDBDetailViewModel: NSObject {
    var disposeBag: DisposeBag! = DisposeBag()
    var provider: MoyaProvider<MovieAPI>! = MoyaProvider<MovieAPI>(plugins: [CompleteUrlLoggerPlugin()])
    
    func detailMovie(id: String, completion: @escaping (_ success: Bool?, _ response: MovieDBDetailModel?) -> Void) {
        provider.rx.request(.getMovieDetail(id))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .subscribe(onSuccess: { response in
                guard let jsonData = try? JSONSerialization.data(withJSONObject: response) else { return }
                let json = JSON(jsonData)
                let resIn = MovieDBDetailModel(json: json)
                completion(true, resIn)
                
            }, onError: { error in
                print(error.localizedDescription)
                completion(false, nil)
                
            }).disposed(by: disposeBag)
    }
    
    func getVideoLink(id: String, completion: @escaping (_ urlLink: String?) -> Void) {
        provider.rx.request(.getVideo(id))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .subscribe(onSuccess: { response in
                guard let jsonData = try? JSONSerialization.data(withJSONObject: response) else { return }
                do {
                    let decoder = JSONDecoder()
                    let res = try decoder.decode(MovieDBMovieModel.self, from: jsonData)
                    
                    if let urlYoutube = res.results?.first?.key {
                        completion(Credential.URL.baseYoutube + urlYoutube)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
                
            }, onError: { error in
                print(error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    func joinGenre(_ arrayString: [MovieDBMovieDetailGenres]?) -> String {
        var genres = [String]()
        guard let arr = arrayString else { return "" }
        arr.forEach { genres.append($0.name ?? "") }
        
        return genres.joined(separator: ", ")
    }
}

