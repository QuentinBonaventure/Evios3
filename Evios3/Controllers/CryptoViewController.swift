//
//  CryptoViewController.swift
//  Evios3
//
//  Created by Quentin Bona on 14/09/2022.
//

import UIKit
import Alamofire
import AlamofireImage

class CryptoViewController: UIViewController {
    
    private var cryptos = [Crypto]()

    @IBOutlet var myTabView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crypto"
        
        myTabView.dataSource = self
        
        myTabView.register(UINib(nibName: CustomCryptoCell.identifier, bundle: .main), forCellReuseIdentifier: CustomCryptoCell.identifier)
        // Do any additional setup after loading the view.
        fetchCryptos()
    }
    
    func fetchCryptos(){
        let apiURL = URL(string: "https://api.coinstats.app/public/v1/coins?skip=0&limit=50&currency=EUR")!
        AF.request(apiURL).response{
            [weak self] response in
            switch response.result{
               
                case .success(let data):
                    guard let data = data else{return}
                    do{
                        let result = try JSONDecoder().decode(Coins.self, from: data)
                        self?.cryptos = result.coins
                        self?.myTabView.reloadData()
                    }
                    catch{
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
           
        }
    }
    

  

}

extension CryptoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCryptoCell.identifier, for: indexPath) as? CustomCryptoCell
        else{
            fatalError("Unable to dequeue customCryptoCell")
        }
        cell.setup(crypto: cryptos[indexPath.row])
        return cell
    }
    
    
}


