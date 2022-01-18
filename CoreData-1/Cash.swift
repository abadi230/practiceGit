//
//  Cash.swift
//  CoreData-1
//
//  Created by Abdullah Bajaman on 17/01/2022.
//

import UIKit

class Cash: UIViewController {

    let cach = NSCache<NSString,NSData>()
    var cacheString: NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "image")?.pngData()
        
        if let cachedVersion = cach.object(forKey: "CachedObject"){
            
        }
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
