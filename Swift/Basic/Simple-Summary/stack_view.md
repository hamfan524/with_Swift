tags : #ios #stack #스택 #뷰 #ui #uikit 

# Contents
- 3개의 ui를 저장하는 스택 뷰

```swift
// stack view
lazy var stackView: UIStackView = {
	let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
	st.spacing = 18
	st.axis = .vertical
	st.distribution = .fillEqually
	st.alignment = .fill
	return st
}()
```
- axis로 가로 스택, 세로 스택 설정
- arrangedSubviews로 속하는 ui들 한번에 설정

[[note_list_ios]]
[[UI_with_code]]