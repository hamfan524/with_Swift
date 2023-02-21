tags : #ios #timer #타이머

# Contents
- 타이머 설정 방법 (1초 마다 block을 반복?)
```swift
// timer는 타이머 객체
timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
	if number > 0{
		number -= 1
		slider.value = Float(number) / Float(60)
		mainLabel.text = "\(number) 초"
	} else {
		number = 0
		mainLabel.text = "초를 선택하세요"
		timer?.invalidate()
	}
}) // block에 클로저를 준다.

timer?.invalidate() // 를 이용하여 안 쓸땐 항상 꺼준다.

```

```swift
timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)

@objc func doSomethingAfter1Second() {}

// 함수 이름을 위처럼 넣어주는 것은 objective-c의 방식이다. @objc 사용해줘야
```

- making IOS  app 1번 프로젝트에서 사용

[[note_list_ios]]