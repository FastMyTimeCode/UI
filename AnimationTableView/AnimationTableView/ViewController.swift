//
//  ViewController.swift
//  AnimationTableView
//
//  Created by Hiem Seyha on 6/4/18.
//  Copyright © 2018 Hiem Seyha. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

   @IBOutlet weak var myTableView: UITableView!
   
   var cell : AnimationTableViewCell!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      myTableView.dataSource = self
      myTableView.delegate = self
      myTableView.register(AnimationTableViewCell.registerNib(), forCellReuseIdentifier: AnimationTableViewCell.cellID)
      
      myTableView.rowHeight = UITableViewAutomaticDimension
      myTableView.rowHeight = 65
      myTableView.estimatedRowHeight = 124
      
      
     let network = NetworkLayer()
      network.get(type: TestModel.self) { (result) in
         let model: TestModel = result!
         debugPrint(model.origin)
         debugPrint(model.url)
      }
        
      
   }

  
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 30
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
       cell = tableView.dequeueReusableCell(withIdentifier: AnimationTableViewCell.cellID, for: indexPath) as! AnimationTableViewCell
      cell.selectionStyle = .none
  
      return cell
   }
   
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     tableView.deselectRow(at: indexPath, animated: true)
   }

  
}

