import UIKit

class SectionHeader: UICollectionReusableView {
    @IBOutlet weak var sectionHeaderlabel: UILabel!
}

struct Company {
    let name: String
    let logo: String
}

class MainMenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    var shifts = [Company(name: "Comcast", logo: "cmcsa_logo"), Company(name: "SmoakHaus", logo: "smoakhaus_logo2")]
    var admins = [Company(name: "SmoakHaus", logo: "smoakhaus_logo2")]
    
    override func viewDidLoad() {
        collectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return shifts.count
        case 1:
            return admins.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader {
            switch indexPath.section {
            case 0:
                sectionHeader.sectionHeaderlabel.text = "Shifts"
            case 1:
                sectionHeader.sectionHeaderlabel.text = "Admins"
            default:
                break
            }
            return sectionHeader
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = ShiftCollectionViewCell()
        switch indexPath.section {
        case 0:
            let shift = shifts[indexPath.row]
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllShiftsView", for: indexPath) as! ShiftCollectionViewCell
            cell.companyLogo.image = UIImage(named: shift.logo)
            cell.companyName.text = shift.name
        case 1:
            let admin = admins[indexPath.row]
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllShiftsView", for: indexPath) as! ShiftCollectionViewCell
            cell.companyLogo.image = UIImage(named: admin.logo)
            cell.companyName.text = admin.name
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var shift: Company?
        switch indexPath.section {
        case 0:
            shift = shifts[indexPath.row]
        case 1:
            shift = admins[indexPath.row]
        default:
            break
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let shiftDetailViewController = storyboard.instantiateViewController(withIdentifier: "ShiftDetail") as! ShiftDetailViewController
        
        if let s = shift {
            shiftDetailViewController.company = s
        }
        
        //since you are pushing this to a stack - ie back button. It should be instead loaded on a UINavigationController
        self.present(shiftDetailViewController, animated: true) {}
    }
}
