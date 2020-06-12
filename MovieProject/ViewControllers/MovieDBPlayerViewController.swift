//
//  MovieDbPlayerViewController.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import UIKit
import WebKit

class MovieDBPlayerViewController: UIViewController {
    @IBOutlet var webView: WKWebView!

    var urlString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.title = ""
             title = "Movie Player"

        if let url = urlString {
            loadYoutube(videoID: url)
        }
    }

    func loadYoutube(videoID: String) {
        guard let youtubeURL = URL(string: videoID) else { return }
        let urlReq = URLRequest(url: youtubeURL)
        webView.load(urlReq)
    }
}
