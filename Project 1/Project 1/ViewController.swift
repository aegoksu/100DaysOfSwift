//
//  ViewController.swift
//  Project 1
//
//  Created by AHMET on 24.09.2022.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        // Storm Viewer yazısının büyük görünmesini sağlar.
        
        let fm  = FileManager.default
        // Dosya sistemiyle çalışmamıza izin veren bir veri türüdür. Dosyaları aramak için kullanacağız.
        let path = Bundle.main.resourcePath!
        // Uygulamama eklediğim tüm resimleri nerede bulabileceğimi söylüyor.
        let items = try! fm.contentsOfDirectory(atPath: path)
        // Dosya adlarını içeren bir dizi

        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort()
        // görüntüleri sıralar
        print(pictures)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
        // Tabloda kaç satır görüneceğini belirleyen yöntem
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath )
        //CPU zamanından ve RAM'den tasarruf etmek için iOS yalnızca çalışması gerektiği kadar satır oluşturur. Bir satır ekranın üst kısmından uzaklaştığında, iOS onu alıp alttan gelen yeni bir satıra dönüştürülmeye hazır bir yeniden kullanım kuyruğuna koyacaktır.
        cell.textLabel?.text = pictures[indexPath.row]
      
        return cell
        // Her satırın nasıl görüneceğini belirleyen yöntem
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //herhangi bir tablo satırına dokunulduğunda ayrıntı ekranını göstermek ve seçilen görüntüyü göstermesini sağlamaktır.
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
            vc.selectedImage = pictures[indexPath.row]
            // 2: success! Set its selectedImage property
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
            // üstteki ikisi detailview ekranında kaç fotoğraftan kaçıncı onun verisi için
            navigationController?.pushViewController(vc, animated: true)
            // 3: now push it onto the navigation controller
            
        }
    }
}

