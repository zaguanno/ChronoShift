import UIKit

class ShiftDetailViewController: UIViewController {
    
    var company: Company?
    @IBOutlet var companyLogo: UIImageView!
    @IBOutlet var companyName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let c = self.company {
            self.companyName.text = c.name
            self.companyLogo.image = UIImage(named: c.logo)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true) {}
    }
}
