protocol PickerViewDataSource {
    func howManyComponent()
    func howManyRow()
}

protocol PickerViewDelegate {
    func titleToShow()
    func didSelect()
}

class ViewController: PickerViewDataSource, PickerViewDelegate {
    func howManyComponent() {
        print("2")
    }
    
    func howManyRow() {
        print("10")
    }
    
    func titleToShow() {
        print("hello")
    }
    
    func didSelect() {
        print("select")
    }
}

class PickerView {
    var dataSource: PickerViewDataSource?
    var delegate: PickerViewDelegate?
    func howManyComponentIHave() {
        dataSource?.howManyComponent()
    }
    
    func howManyRowIHave() {
        dataSource?.howManyRow()
    }
    
    func whatToShow() {
        delegate?.titleToShow()
    }
    
    func afterSelect() {
        delegate?.didSelect()
    }
}

let aPickerView = PickerView()
let aViewController = ViewController()

aPickerView.dataSource = aViewController
aPickerView.delegate = aViewController

aPickerView.howManyComponentIHave()
aPickerView.howManyRowIHave()

aPickerView.whatToShow()
aPickerView.afterSelect()


