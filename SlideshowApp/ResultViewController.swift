//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by  葛西 on 2024/08/08.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var biggerImage: UIImageView!
    
    var img: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        biggerImage.image = img
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
