//
//  ViewController.swift
//  CoreData-1
//
//  Created by Abdullah Bajaman on 17/01/2022.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    var names: [Person] = []
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        names = getData()
        
    }
    @IBAction func onClickAdd(_ sender: UIButton) {
        if let text = nameTF.text {
            CreateData(name: text)
            names = getData()
            myTableView.reloadData()
        }
    }
    
    func CreateData(name: String){
        let nawPerson = Person(context: context)
        nawPerson.firstName = name
        nawPerson.lastName = "?"
        saveData()
    }
    
    func saveData(){
        // save to DB
        do {// save function throws error so we have to use try catch
            try context.save()
        } catch {
            print("Unable to save")
        }
    }
    func getData()->[Person]{
//        let req = Person.fetchRequest()
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        var persons : [Person] = []
        do{
            persons = try context.fetch(request)
        }catch{
            print(error.localizedDescription)
        }
        return persons
    }
    func delete(obj: Person){
        context.delete(obj)
        saveData()
        
        
    }
    func update(obj: Person, name: String){
        obj.firstName = name
        saveData()
    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.nameLbl.text = names[indexPath.row].firstName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Update") as! Update
        vc.person = names[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDelete = UIContextualAction(style: .destructive, title: "Delete") { action, view
            , complation in
            self.delete(obj: self.names[indexPath.row])
            self.names.remove(at: indexPath.row)
            self.myTableView.reloadData()
            complation(true)
            
        }
        return UISwipeActionsConfiguration(actions: [actionDelete])
    }
    
}
