//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Vishal Kashyap on 16/08/23.
//

import UIKit

class CassiniViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        print("🔴 loaded")
//        // Do any additional setup after loading the view.
//    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
                if let imageVC = segue.destination as? ImageViewController {
                    imageVC.imageURL = url
                    
                    if let navController = self.navigationController {
                        print("hey this is the count of the \(navController.viewControllers.count)" )
//                        navController.popViewController(animated: true)
                    }
                    
                    if let title = (sender as? UIButton)?.titleLabel?.text {
                        imageVC.title = title
                    }
                }
            }
        }
        
    }

}
