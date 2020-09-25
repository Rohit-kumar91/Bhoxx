//
//  ShowAllCategories.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 08/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

protocol ShowAllCategoryDelegate: class {
    func showAllServices(salonId: String?)
}

class ShowAllCategories: UIViewController {
    
    @IBOutlet weak var tableSaloons: UITableView!
    
    var saloons = [GetCategoryByIDModel]()
    var delegate: ShowAllCategoryDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableSaloons.dataSource = self
        tableSaloons.delegate = self
        
    }
}

extension ShowAllCategories: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saloons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SaloonTC", for: indexPath) as? SaloonTC
        cell?.data = saloons[indexPath.row]
        cell?.btnShowAllSerices.tag = indexPath.row
        cell?.delegate = self
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
        
}



extension ShowAllCategories: SaloonTCDelegate {
    func buttonTapped(index: Int) {
        delegate?.showAllServices(salonId: saloons[index].id)
    }
}
