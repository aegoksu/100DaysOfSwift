//
//  DetailViewController.swift
//  Project 1
//
//  Created by AHMET on 25.09.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedPictureNumber : Int!
    var totalPictures : Int!

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    //DetailViewController'a yüklenecek görüntünün adını tutacak bir özellik oluşturmak.Bu özellik bir dize olacak ve yüklenecek görüntünün adı – ancak isteğe bağlı bir dize olması gerekiyor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(selectedPictureNumber!) of \(totalPictures!)"
        navigationItem.largeTitleDisplayMode = .never
        // View Controllerdan Miras aldığından dolayı büyük göründü, normal görünmesini sağlamak için bu kodu yazıyoruz.
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        // Bu doğru olarak ayarlandığında, kullanıcı gezinme çubuğunu gizlemek için geçerli görünüm denetleyicisinde herhangi bir yere dokunabilir ve ardından göstermek için tekrar dokunabilir.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        // gezinme çubuğunu sadece burada gizlemek için
    }
}
