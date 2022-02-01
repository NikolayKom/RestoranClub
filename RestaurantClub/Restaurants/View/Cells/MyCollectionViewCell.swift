

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
    
	@IBOutlet private weak var nameOfRestaurant: UILabel!
	@IBOutlet private weak var avarageCheckLabel: UILabel!
	@IBOutlet private weak var adressOrDishLabel: UILabel!
	@IBOutlet private weak var logoImage: UIImageView!
	@IBOutlet private weak var starsImage: UIImageView!
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	
		contentView.layer.cornerRadius = 15.0
		contentView.layer.borderWidth = 1.0
		contentView.layer.borderColor = UIColor.clear.cgColor
		contentView.layer.masksToBounds = true
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 3, height: 5.0)
		layer.shadowRadius = 1.0
		layer.shadowOpacity = 1.0
		layer.masksToBounds = false
		layer.shadowPath = UIBezierPath(
			roundedRect: bounds,
			cornerRadius: contentView.layer.cornerRadius
		).cgPath
		layer.cornerRadius = 15.0
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		logoImage.image = nil
	}
    
//MARK: - Public method
	func configure(model: FakeRestorant) {
        self.nameOfRestaurant.text = model.restaurantName
        self.adressOrDishLabel.text = model.location
        
        self.stars(rating: model.rating)
        self.prepareAvarageCheck(averageCheckRestaurant: model.averageCheckRestaurant)
        
        if let image = model.image.first {
			let urlString = baseURL + "/media/\(image)"
			logoImage.loadImage(urlString: urlString)
		}
	}
    
    func configureSearching(model: FakeRestorant) {
        nameOfRestaurant.text = model.restaurantName
        adressOrDishLabel.text = model.dish
        
        stars(rating: model.rating)
        prepareAvarageCheck(averageCheckRestaurant: model.averageCheckRestaurant)
        
        if let image = model.image.first {
            let urlString = baseURL + "/media/\(image)"
            logoImage.loadImage(urlString: urlString)
        }
    }
    
//MARK: - Private method
    private func stars(rating: Double) {
        switch rating {
        case 0:
            print("Переменная равна 0")
            starsImage.image = #imageLiteral(resourceName: "Star_rating_0_of_5")
        case 0.1...0.5:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_0.5_of_5")
        case 0.6...1:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_1_of_5")
        case 1.1...1.5:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_1.5_of_5")
        case 1.6...2:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_2_of_5")
        case 2.1...2.5:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_2.5_of_5")
        case 2.6...3:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_3_of_5")
        case 3.1...3.5:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_3.5_of_5")
        case 3.6...4:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_4_of_5")
        case 4.1...4.5:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_4.5_of_5")
        case 4.6...5:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_5_of_5")
        default:
            starsImage.image = #imageLiteral(resourceName: "Star_rating_0_of_5")
        }
    }
    
   private func prepareAvarageCheck(averageCheckRestaurant: Int) {
        if averageCheckRestaurant < 1700 {
            avarageCheckLabel?.text = "₽₽"
        } else {
            avarageCheckLabel?.text = "₽₽₽"
        }
    }
}
