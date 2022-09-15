//
//  ViewController.swift
//  Evios3
//
//  Created by Quentin Bona on 14/09/2022.
//

import UIKit
import Alamofire

class CryptoLiveViewController: UIViewController {
    
    
    @IBOutlet var indicatorDownload: UIActivityIndicatorView!
    
    private var cryptosLive =  [CryptoLive]()
    

    @IBOutlet var tabViewCryptoLive: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crypto Live"
        // Do any additional setup after loading the view.
        tabViewCryptoLive.dataSource = self
        tabViewCryptoLive.delegate = self
        tabViewCryptoLive.register(UINib(nibName: CustomCryptoLiveCell.identifier, bundle: .main), forCellReuseIdentifier: CustomCryptoLiveCell.identifier)
        
        fetchCryptos()
        
      
        
    }
    
    
    func fetchCryptos(){
        indicatorDownload.isHidden = false
        indicatorDownload.startAnimating()
        let apiURL = URL(string: "https://api.coincap.io/v2/assets")!
        AF.request(apiURL).response{
            [weak self] response in
            switch response.result {
            case .success(let data):
                guard let data = data else {return}
                do{
                    let result = try JSONDecoder().decode(Datas.self, from: data)
                    self?.cryptosLive = result.data
                    
                    self?.indicatorDownload.isHidden = true
                    self?.indicatorDownload.stopAnimating()
                    self?.tabViewCryptoLive.reloadData()
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

extension CryptoLiveViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptosLive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCryptoLiveCell.identifier, for: indexPath) as? CustomCryptoLiveCell
        else {
            fatalError("Unable to dequeue CustomCryptoLiveCell")
        }
        
        cell.setup(cryptoLive: cryptosLive[indexPath.row])
        
        return cell
                
                
    }
    
    
}

extension CryptoLiveViewController: UITableViewDelegate{
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailsCryptosViewController =
            storyboard?.instantiateViewController(withIdentifier: DetailsCryptoViewController.identifier) as? DetailsCryptoViewController {
            detailsCryptosViewController.crypto = cryptosLive[indexPath.row]
            navigationController?.pushViewController(detailsCryptosViewController, animated: true)
        }else {
            fatalError("unable to instiatiate cryptos live details")
        }
    }
}


