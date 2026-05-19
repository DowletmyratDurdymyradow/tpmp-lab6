import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!

    @IBOutlet weak var heightTextField: UITextField!

    @IBOutlet weak var weightTextField: UITextField!

    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!

    @IBOutlet weak var trainingSegmentedControl: UISegmentedControl!

    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {

        super.viewDidLoad()

        resultLabel.text = ""
    }

    @IBAction func calculateTapped(_ sender: Any) {

        guard let age = Double(ageTextField.text!),
              let height = Double(heightTextField.text!),
              let weight = Double(weightTextField.text!) else {

            resultLabel.text = "Введите корректные данные"

            return
        }

        let heightMeters = height / 100

        let bmi = weight / (heightMeters * heightMeters)

        var bmr: Double

        let isMale = genderSegmentedControl.selectedSegmentIndex == 0

        if isMale {

            bmr = 88.36 +
            (13.4 * weight) +
            (4.8 * height) -
            (5.7 * age)

        } else {

            bmr = 447.6 +
            (9.2 * weight) +
            (3.1 * height) -
            (4.3 * age)
        }

        let trainingIndex =
        trainingSegmentedControl.selectedSegmentIndex

        var multiplier = 1.2

        switch trainingIndex {

        case 0:
            multiplier = 1.2

        case 1:
            multiplier = 1.375

        case 2:
            multiplier = 1.55

        case 3:
            multiplier = 1.725

        default:
            break
        }

        let calories = bmr * multiplier

        resultLabel.text =
        """
        BMI: \(String(format: "%.2f", bmi))

        Calories: \(String(format: "%.0f", calories))
        """
    }
}
