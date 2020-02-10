//
//  MainViewController.swift
//  SPM
//
//  Created by Gonzalo Gonzalez  on 08/02/2020.
//  Copyright © 2020 Gonzalo Gonzalez . All rights reserved.
//

import UIKit
import LoginUI

class MainViewController: UIViewController {
    
    @IBOutlet weak var itemTableView: UITableView!
    
    private var viewModel: MainViewModel!
    private var items: [Item] = []
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: MainViewModel) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil )
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Items"
        configureTable()
        bind()
        viewModel.sessionVerification()
    }
    
    private func configureTable () {
        let cellNib = UINib(nibName: "ItemCell", bundle: Bundle(for: ItemCell.self))
        itemTableView.register(cellNib,forCellReuseIdentifier: "ItemCell")
        itemTableView.separatorColor = .clear
    }
    
    private func bind () {
        
        viewModel.userNotVerified = {
            let loginViewController = LoginViewController.instance()
            loginViewController.modalPresentationStyle = .fullScreen
            self.present(loginViewController, animated: true) {
                self.viewModel.loadItems()
            }
        }
        
        viewModel.itemsCollectionUpdated = {
            self.items = self.viewModel.itemsCollection
            self.itemTableView.reloadData()
        }
    }
}

extension MainViewController {
    
    static func instance() -> MainViewController {
        let modelView: MainViewModel = MainViewModel(itemRepository: ItemRepository.instance)
        return MainViewController(nibName: "MainView", bundle: nil, viewModel: modelView)
    }
}

// MARK: - TableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    enum TableSection: Int {
        case items = 0,  total
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        let item = items[indexPath.row]
        
        cell.configureCell(name: item.name, price: String(item.price), category: item.category.rawValue, brand: item.brand)
        
        return cell
    }
}

// MARK: - TableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
