

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorKeyLabel: UILabel!
    @IBOutlet weak var authorValueLabel: UILabel!
    
    @IBOutlet weak var genreKeyLabel: UILabel!
    @IBOutlet weak var genreValueLabel: UILabel!
    
    @IBOutlet weak var lengthKeyLabel: UILabel!
    @IBOutlet weak var lengthValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with book: Book) {  
        titleLabel.text = book.title
        authorValueLabel.text = book.author
        genreValueLabel.text = book.genre
        lengthValueLabel.text = "\(book.length) pages"
    }
}
