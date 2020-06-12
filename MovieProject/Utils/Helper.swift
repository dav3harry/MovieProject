//
//  Helper.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import Foundation
import SDWebImage

class Helper: NSObject {
    static func loadImage(imageView: UIImageView, url: String?) {
        guard let urlString = url else {
            return
        }
        
        imageView.sd_setImage(with: URL(string: urlString))
    }
    
}


class AlertHelper {
    static let share = AlertHelper()
    public func show(in view: UIViewController, title: String, message: String, completion: (() -> ())?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alertController.addAction(action)
        view.present(alertController, animated: true, completion: nil)
    }
}
