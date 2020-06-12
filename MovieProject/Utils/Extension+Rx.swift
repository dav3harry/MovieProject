//
//  Extension+Rx.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Moya
import Alamofire

extension Reactive where Base: DataRequest {
    
    func responseJSON() -> Observable<Any> {
        return Observable.create { observer in
            let request = self.base.responseJSON { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create(with: request.cancel)
        }
    }
}

enum SearchFailureReason: Int, Error {
    case unAuthorized = 401
    case notFound = 404
}

class CompleteUrlLoggerPlugin : PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        print(request.request?.url?.absoluteString ?? "Something is wrong")
    }
}
