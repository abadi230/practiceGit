//
//  Update.swift
//  CoreData-1
//
//  Created by Abdullah Bajaman on 17/01/2022.
//

import UIKit

class Update: UIViewController {

    var person: Person!
    @IBOutlet weak var nameOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameOutlet.text = person.firstName
    }
    
    @IBAction func onClickUpdate(_ sender: UIButton) {
        update(obj: person, name: nameOutlet.text!)
        dismiss(animated: true, completion: nil)
    }
    
    func update(obj: Person, name: String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        obj.firstName = name
        // save to DB
        do {// save function throws error so we have to use try catch
            try context.save()
        } catch {
            print("Unable to save")
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
