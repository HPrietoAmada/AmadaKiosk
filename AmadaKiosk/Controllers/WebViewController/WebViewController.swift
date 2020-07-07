//
//  WebViewController.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/8/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var timeoutInSeconds: TimeInterval = 15
    var timer: Timer = Timer()

    var urlString: String = "" {
        didSet {
            guard let url = URL(string: urlString) else { return }
            var urlRequest: URLRequest = URLRequest(url: url)
            urlRequest.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
            webView.load(urlRequest)
        }
    }

    lazy var webView: WKWebView = {
        let webView: WKWebView = WKWebView()
        webView.backgroundColor = .clear
        webView.allowsBackForwardNavigationGestures = false
        webView.translatesAutoresizingMaskIntoConstraints = false

        var gesture: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(handleWebViewTapped)
        )
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        webView.addGestureRecognizer(gesture)
        return webView
    }()

    @objc func handleWebViewTapped() {
        print("Tapped")
    }

    lazy var rightBarButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        return item
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = isDarkMode() ? .black : .white
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetTimer()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        clean()
    }

    private func clean() {
        webView.load(URLRequest(url: URL(string:"about:blank")!))
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                print("[WebCacheCleaner] Record \(record) deleted")
            }
        }
    }

    func resetTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: timeoutInSeconds,
            target: self,
            selector: #selector(timeExceeded),
            userInfo: nil,
            repeats: true
        )
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print(timer.timeInterval, "reset")
        resetTimer()
    }

    @objc func timeExceeded() {

    }

    func setup() {
        view.addSubview(webView)

        navigationItem.rightBarButtonItem = rightBarButtonItem

        webView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        webView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        webView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
