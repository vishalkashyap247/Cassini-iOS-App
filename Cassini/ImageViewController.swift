//
//  ImageViewController.swift
//  Cassini
//
//  Created by Vishal Kashyap on 14/08/23.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    
    
//    @IBOutlet weak var imageView: UIImageView!
    var imageView = UIImageView()
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0 //we dont want to zoom further thats why
            scrollView.delegate = self
            
            scrollView.addSubview(imageView) //here imageView is added as subview of scrollView
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    var imageURL: URL? {
        didSet {
            image = nil //imageView.image = nil
//            imageView.sizeToFit()
//            scrollView.contentSize = imageView.frame.size//this all done by get set I forgot the name
            if view.window != nil {
                fetchImage()
//                print("fetch image called")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    private var image: UIImage? { //see this guy see this guy //computed properties
        get {
            imageView.image
        }
        set {
            imageView.image = newValue //newValue is newValue 😎
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size //optional chaining
            spinner?.stopAnimating() //stop the spinner and set the spinner as hide when stoppes
        }
    }
    
    
    private func fetchImage() {
        if let url = imageURL {
            spinner.startAnimating() //to start the spinner
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in //check this out in not notebook of L10
                let urlContents = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = urlContents, url == self?.imageURL {
        //                imageView.image = UIImage(data: imageData)
                        self?.image = UIImage(data: imageData) //check this question mark also
        //                imageView.sizeToFit()
        //                scrollView.contentSize = imageView.frame.size
                    }
                }
            }
            //get data from url
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("view did load of imageViewController")
        if imageURL == nil {
//            imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/55/Stanford_Oval_September_2013_panorama.jpg")
//            print("hey Im here")
            imageURL = DemoURLs.stanford
        }
        
        
        if let navController = self.navigationController {
            print("hey this is the count of the \(navController.viewControllers.count)" )
//            navController.popViewController(animated: true)
        }
        
        if let splController = self.splitViewController {
            print("hey this is the count of the split \(splController.viewControllers.count)" )
//            splController.popViewController(animated: true)
        }
        
        
//        if let navigationController, let viewController = navigationController.topViewController { //check this out
//            navigationController.viewControllers = [viewController]
//        }
        
        
        
        
        print("🟢S", self.splitViewController?.viewControllers)//check this out
        print("🟢N", self.navigationController?.viewControllers)
        
//        if let navigationController, navigationController.viewControllers.count>0
//        {
//            navigationController.viewControllers = //.popLast()
            
//            navigationController.viewControllers.popLast()
//        }
        
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
