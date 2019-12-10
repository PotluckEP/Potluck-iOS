//
//  PlanningViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 10/22/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PlanningViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var list: List!
    var items = [Item]()
    var ref: DatabaseReference!
    
    @IBOutlet weak var itemTextView: UILabel!
    @IBOutlet weak var personInChangeImg: UIImageView!
    @IBOutlet weak var personInChargeTextView: UILabel!
    @IBOutlet weak var itemsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        itemsCollection.delegate = self
        itemsCollection.dataSource = self
        
        fetchPlanning();
    }
    
    func fetchPlanning(){

        guard self.list != nil else {
            return
        }
        self.ref.child(list.path).observeSingleEvent(of: .value) { (snapshot) in
            
            var item = snapshot.value as! [String: Any]
            
            if(item["bringing"] == nil){
                // is item
            }
            
            self.itemTextView.text = item["name"] as? String
            item.removeValue(forKey: "name");

//            self.ref.child("users").child(item["charge"] as! String).observeSingleEvent(of: .value, with: { (snapshot2) in
//                let user = snapshot2.value as! [String: Any]
//                self.personInChargeTextView.text = user["name"] as! String
//            })
            
            item.removeValue(forKey: "charge");
            item.removeValue(forKey: "type");
            
            for (itemId, bringing) in item  {
                
                self.ref.child(self.list.path).child(itemId).observeSingleEvent(of: .value) { (snapshot2) in
                    
                    let details = snapshot2.value as! [String: Any]
                   
                    let name = details["name"] as! String
                    let itemType = details["type"] as! String
                    
                    self.ref.child(self.list.path).child(itemId).child("bringing").observeSingleEvent(of: .value) { (snapshot3) in
                        
                       // print(snapshot3)
                    }
                    
                    self.items.append(Item(id: itemId, name: name, person: "fix", image: "none", details: "none", owner: "none", type: itemType, path: self.list.path + "/" + itemId))
                    
                    self.itemsCollection.reloadData();
                }
            }
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemsCollection.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.ItemName.text = self.items[indexPath.item].name;
        
        cell.person.text = self.items[indexPath.item].person;
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        if item.type == "item" {

//               let destinationVC = itemViewController()
//               destinationVC.path = item.path
//
//               destinationVC.performSegueWithIdentifier("itemViewController", sender: self)
            
                
            self.performSegue(withIdentifier: "itemViewController", sender: nil)
        } else {
            list = List(id: item.id, name: item.name, charge: item.owner, details: item.details, owner: item.owner, path: item.path + "/bringing")
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if #available(iOS 13.0, *) {
                let vc = storyboard.instantiateViewController(identifier: "PlanningVC") as PlanningViewController
                
                vc.list = list
                self.navigationController?.pushViewController(vc, animated: true)
//                present(vc, animated: true, completion: nil)
                
            } else {
                // Fallback on earlier versions
            }
            
        }

    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
       if segue.destination is AddItemViewController{
        
            let addItemViewController = segue.destination as! AddItemViewController
            
            addItemViewController.path = list.path
        }
        
        if segue.description is InfoListViewController{
            
            print("sfksjdklfskdjflkdskfjkldsjfjkdsjkfjksd")
            let infoListViewController = segue.destination as! InfoListViewController
            
            infoListViewController.path = list.path
        }
        
    }
}
