tags: #ios #textField #ui #uikit #텍스트필드 #delegate #pattern #텍스트 #필드

# Contents
- 이메일 입력 창
```swift
// 해당 뷰 클래스 선언시
class ViewController: UIViewController, UITextFieldDelegate

// viewDidLoad 함수 내
// viewcontroller 안에 delegate로 인해 많은 함수들을 만들 수 있고,
// 그 만들어진 함수들을 스스로에게 적용 시킨다는 것이다.
textField.delegate = self // self는 viewController 클래스. 다른 view라면 그 클래스


// 셋업
textField.keyboardType = UIKeyboardType.emailAddress
textField.placeholder = "이메일 입력"
textField.borderStyle = .roundedRect
textField.becomeFirstResponder() // 해당 윈도우를 들어갈 때 가장 먼저 반응. (키보드가 올라옴)

// 버튼 등이 있을 때 내부에
textField.resignFirstResponder() // 버튼이 눌릴 때 입력을 끝내고 firstresponder를 끝낸다.

// 화면을 눌렀을 때 end editting이 되도록 viewDidRoaded 아래에 다음과 같은 함수를 오버라이드 해준다.
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
	self.view.endEditing(true)
	textField.resignFirstResponder()
}

    // 텍스트필드의 입력을 시작할 때 호출 (시작할지말지 여부)

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

        print(#function)

        return true

    }

    // 반환값이 없다. 보통은 시점을 뜻한다.

    func textFieldDidBeginEditing(_ textField: UITextField) {

        print(#function)

        print("유저가 텍스트필드의 입력을 시작했다.")

    }

    // x 버튼 누르면 지워질지

    func textFieldShouldClear(_ textField: UITextField) -> Bool {

        print(#function)

        return false

    }

    // 입력 하나하나마다 string으로 입력을 가져온다.

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        print(string)

        print(#function)

        return true

    }

    // 텍스트 필드중 엔터키 허용 여부

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        print(#function)

        return true

    }

    // 텍스트 필드 입력 끝 허용 여부

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {

        print(#function)

        return true

    }

    // 텍스트 필드의 입력이 끝났을 때

    func textFieldDidEndEditing(_ textField: UITextField) {

        print(#function)

        print("유저가 입력을 끝냈다.")

    }
```
</br>

```swift
// 아래 함수부터
// func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
// 함수 내에 적어주면 동작한다.
```
```swift
// 최대 길이를 maxLength로 설정해 주는 코드
let maxLength = 1
let currentString: NSString = (textField.text ?? "") as NSString
let newString: NSString =
	currentString.replacingCharacters(in: range, with: string) as NSString
return newString.length <= maxLength
```
```swift
//입력되고 있는 글자가 "숫자"인 경우 입력을 허용하지 않는 논리

1f Int(string) 1= n11 {// (숫자로 변환이 된다면 n110 아닐테니)
	return false
} else {
	guard let text = textfield.text else { return true }
	let newLength = text.count + string. count - range. length
	r eturn newLength <= 10
}
```

위의 코드들의 는 무시하면 된다...


ui로 view위에 존재하지만, 별개로 따로 존재한다고 생각하는게 편하다.
- 유저와 커뮤니케이션 하기 때문
- 하나의 액션으로 동작하지 않는다.


[[UI_with_code]]
[[note_list_ios]]
[[delegate_pattern]]
