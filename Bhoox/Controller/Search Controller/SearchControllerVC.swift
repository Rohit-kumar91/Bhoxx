//
//  SearchControllerVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 25/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

enum SearchType: String {
    case City = "City"
    case Category = "Category"
}

protocol SearchCustomDelegate: class {
    func searchByCity(id: String, name: String)
    func searchByCategory(id: String, name: String)
}




class SearchControllerVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnSave: UIButton!
    
    //MARK: Properties
    var delegate: SearchCustomDelegate? = nil
    var searchType: SearchType = .Category
    var cities = [Cities]()
    var categories = [ResponseData]()
    var filterCities = [Cities]()
    var filterCategories = [ResponseData]()
    var shouldShowSearchResults = false

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //MARK:- Actions
    @IBAction func btnSaveAction(_ sender: Any) {
        
        switch searchType {
        case .Category:
            dismiss(animated: true) {
                self.delegate?.searchByCategory(id: "", name: "")
            }
            break
            
        default:
            dismiss(animated: true) {
                self.delegate?.searchByCity(id: "", name: "")
            }
        }
    }
    
    
   
    
    
}


extension SearchControllerVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        switch searchType {
            case .Category:
                filterCategories = /searchBar.text?.isEmpty ? categories : categories.filter {
                    return $0.cat_name?.range(of: searchText, options: .caseInsensitive) != nil
                }

                tableView.reloadData()
                
            break
            
        default:
            
            filterCities = /searchBar.text?.isEmpty ? cities : cities.filter {
                return $0.city?.range(of: searchText, options: .caseInsensitive) != nil
            }
            
            tableView.reloadData()
        }
        
    }
    
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        //tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


extension SearchControllerVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch searchType {
        case .Category:
            return shouldShowSearchResults ? filterCategories.count : categories.count
        default:
            return shouldShowSearchResults ? filterCities.count : cities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableCell", for: indexPath) as? SearchTableCell
        
         switch searchType {
           case .Category:
            cell?.category = shouldShowSearchResults ? filterCategories[indexPath.row] : categories[indexPath.row]
           default:
            cell?.cities = shouldShowSearchResults ? filterCities[indexPath.row] : cities[indexPath.row]
         }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch searchType {
          case .Category:
            
            for (index, _) in shouldShowSearchResults ? filterCategories.enumerated() : categories.enumerated() {
                if index == indexPath.row {
                    if shouldShowSearchResults {
                      filterCategories[index].isSelected =  true
                    } else {
                      categories[index].isSelected =  true
                    }
                    
                } else {
                    if shouldShowSearchResults {
                      filterCategories[index].isSelected =  false
                    } else {
                      categories[index].isSelected =  false
                    }
                }
            }
            
            tableView.reloadData()

          default:
            for (index, _) in shouldShowSearchResults ? filterCities.enumerated() : cities.enumerated() {
                if index == indexPath.row {
                    if shouldShowSearchResults {
                        filterCities[index].isSelected =  true
                    } else {
                        cities[index].isSelected =  true
                    }
                    
                } else {
                    if shouldShowSearchResults {
                        filterCities[index].isSelected = false
                    } else {
                        cities[index].isSelected = false
                    }
                    
                }
            }
             tableView.reloadData()
        }
    }
    
    
}

