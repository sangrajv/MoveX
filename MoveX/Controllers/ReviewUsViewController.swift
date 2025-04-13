//
//  ReviewUsViewController.swift
//  MoveX
//
//  Created by Priyanshu Kaushik on 2025-04-13.
//
//  Description: This view controller presents a web view for users to leave a review for the app.
//  It loads an external review website inside a WKWebView and shows an activity indicator while loading.
//
import UIKit
import WebKit

class ReviewUsViewController: UIViewController, WKNavigationDelegate {
    
    // Web view used to load the review page
        @IBOutlet var webView: WKWebView!
        
    // Activity indicator shown while the page is loading
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // WHY: Set this view controller as the navigation delegate to monitor loading status
        webView.navigationDelegate = self
        loadReviewPage()

        // Do any additional setup after loading the view.
    }
    
    // Purpose: Loads the review website into the web view.
    // WHY: Construct and load a URL request for the review site
    func loadReviewPage(){
        if let url = URL(string: "https://ca.trustpilot.com"){
            let request = URLRequest(url: url)
            webView.load(request)
            activityIndicator.startAnimating()
        }
    }
    
    // WHY: Hide the activity indicator once the content is fully loaded
    // Purpose: Stops the activity indicator when the web page finishes loading.
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
