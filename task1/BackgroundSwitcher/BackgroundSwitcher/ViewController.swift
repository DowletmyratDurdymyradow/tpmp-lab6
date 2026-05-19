import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundSwitch: UISwitch!

    @IBOutlet weak var switchIndicator: UILabel!

    override func viewDidLoad() {

        super.viewDidLoad()

        switchIndicator.textColor = UIColor.white

        switchIndicator.text = "Background image: bg2.jpg"

        view.backgroundColor = UIColor(
            patternImage: UIImage(named: "bg2")!
        )
    }

    @IBAction func backgroundSwitchTapped(_ sender: Any) {

        if backgroundSwitch.isOn {

            switchIndicator.text = "Background image: bg1.jpg"

            view.backgroundColor = UIColor(
                patternImage: UIImage(named: "bg1")!
            )

        } else {

            switchIndicator.text = "Background image: bg2.jpg"

            view.backgroundColor = UIColor(
                patternImage: UIImage(named: "bg2")!
            )
        }
    }
}
