//
//  PlanningViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 10/22/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import FirebaseDatabase

//https://www.youtube.com/watch?v=9sp_u18fPlM&list=PLrT2tZ9JRrf4FG0wKkZGUTFqkkS3TiHKv&index=6
//8:13

class PlanningViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    var event: Event!
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
        
        self.ref.child(event.path).observeSingleEvent(of: .value) { (snapshot) in
            let item = snapshot.value as! [String: Any]
            self.itemTextView.text = item["name"] as? String
            
            for (itemName, plan) in item  {
                
                let name: String;
                
                //fix get id of person in charge
                //let id = plan["charge"] as! String
                
                // repeated code
//                self.ref.child("users").child(id).observeSingleEvent(of: .value, with: { (snapshot2) in
//                    let user = snapshot.value as! [String: Any]
//                    name = user["name"] as! String
//                })
//
                self.items.append(Item(id: "", name: itemName, person: "fix", image: "none", details: "none", owner: "none", path: self.event.path + "/" + itemName))
            }
            
            self.itemsCollection.reloadData();
        }
        
        self.ref.child("users").child(event.owner).observeSingleEvent(of: .value, with: { (snapshot) in
            let user = snapshot.value as! [String: Any]
            self.personInChargeTextView.text = user["name"] as! String
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemsCollection.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.ItemName.text = self.items[indexPath.item].name;
        cell.person.text = self.items[indexPath.item].person;
        
        print(self.items[indexPath.item].name)
        return cell
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
