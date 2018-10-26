//
//  ViewController.swift
//  ExhibitionsApp
//
//  Created by Maryan Pasichniak on 10/26/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var exhibitsLoader: FileExhibitsLoader!
    var exhibitsData: [Exhibit] = []
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        exhibitsLoader = FileExhibitsLoader.init(requestSender: NetworkingManager(), requestBuilder: RequestBuilder())
        exhibitsLoader.getExhibitList {[weak self] (data) in
            self?.exhibitsData = data
            self?.tableView.reloadData()
        }
        registerNibs()
    }
    
    // MARK: - Private Methods
    private func registerNibs() {
        let nib = UINib(nibName: ExhibitCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ExhibitCell.reuseIdentifier)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate, ExhibitCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExhibitCell.reuseIdentifier) as? ExhibitCell else
        { return UITableViewCell() }
        cell.configureWith(exhibitsData[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func updateSelectedExhibitWith(exhibit: Exhibit, cell: ExhibitCell) {
        if let index = tableView.indexPath(for: cell) {
            exhibitsData[index.row] = exhibit
        }
    }
}

