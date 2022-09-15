//
//  DetailsCryptoViewController.swift
//  Evios3
//
//  Created by Quentin Bona on 14/09/2022.
//

import UIKit
import Alamofire

class DetailsCryptoViewController: UIViewController {
    
    static let identifier = "DetailsCryptoViewController"
    
    private var historics = [Historic]()
    
    @IBOutlet var indicatorDownload: UIActivityIndicatorView!

    @IBOutlet var historicTabView: UITableView!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var crypto : CryptoLive!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        historicTabView.dataSource = self
        historicTabView.register(UINib(nibName: CustomDetailsCell.identifier, bundle: .main), forCellReuseIdentifier: CustomDetailsCell.identifier)
        
        fetchHistorics()
        
        
    }
    

    func setup(){
        valueLabel.text = crypto?.value
        nameLabel.text = crypto?.name
    }
    
    func fetchHistorics(){
        let apiURL = URL(string: "https://api.coincap.io/v2/assets/bitcoin/history?interval=d1")!
        
        indicatorDownload.isHidden = false
        indicatorDownload.startAnimating()
        
        AF.request(apiURL).response{
            [weak self] response in
            switch response.result {
                
            case .success(let data):
                guard let data = data else {return}
                do{
                    let result = try JSONDecoder().decode(DatasDetails.self, from: data)
                    self?.historics = result.data
                    self?.historicTabView.reloadData()
                    self?.indicatorDownload.isHidden = true
                    self?.indicatorDownload.stopAnimating()
                    
                }
                catch{
                    print(error)
                    
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    



}

extension DetailsCryptoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomDetailsCell.identifier, for: indexPath) as? CustomDetailsCell
        else{
            fatalError("Unable to dequeue customdetailcell")
        }
        
        cell.setupCrypto(historic: historics[indexPath.row])
        return cell
    }
    
    
}
