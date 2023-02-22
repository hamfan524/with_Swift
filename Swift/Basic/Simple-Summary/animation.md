tags : #ios #animation #ui #uikit

# animate
- delegate 등에 사용하기 좋다.
- 

```swift
UIView.animate(withDuration: 0.3) {
  self.stackView.layoutIfNeeded()
}
// 스택 뷰 내부의 모든 것들을 자연스럽게 보이도록 만들어 준다.
```

```swift
extension ViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {

        if textField == emailTextField {

            emailTextFieldView.backgroundColor =  colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)

            emailInfoLabelCenterConstraint.constant = -13

        }

        if textField == passwordTextField {

            passwordTextFieldView.backgroundColor =  colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)

            passwordInfoLabelCenterConstraint.constant = -13

        }

        UIView.animate(withDuration: 0.3) {

            self.stackView.layoutIfNeeded()

        }

    }
}

// 동적으로 오토 레이아웃을 바꾸고 싶다면 constraint 변수가 필요하다.
```
[[ui_textfield]]
[[note_list_ios]]