//
//  NewsArticleTableViewCell.swift
//  NewsApp
//
//  Created by ビジャイクマール デックシット ディッバダハッリ on 2023/02/24.
//

import UIKit




class NewsArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.articleImage.layer.cornerRadius = 5
        self.articleImage.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(with viewModel: NewsArticleViewModel){
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        
        if let data = viewModel.image{
            articleImage.image = UIImage(data: data)
        }
        else if let url = viewModel.imageUrl{
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                viewModel.image = data
                DispatchQueue.main.sync {
                    self?.articleImage.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    
}
