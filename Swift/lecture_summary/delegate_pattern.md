tags: #ios #textField #텍스트필드 #delegate #pattern

- 채택하면 능력이 생기게 한다.

```swift
protocol RemoteControlDelegate {
	func channelUp()
	func channelDown()
} // 이런 식으로 protocol을 사용해 주어야 한다.

class RemoteControl {
	var delegate: [[stack view 스택 뷰]]RemoteControlDelegate?
	
	func doSomething() {
		print("리모컨 조작이 일어나고 있음")
	}
	func channelUp() {
		delegate?.channelUp()
	}
	func channelDown() {
		delegate?.channelDown()
	} // 어떤 기기가 동작하는지 몰라도 된다.
}

class TV: RemoteControlDelegate { // 프로토콜을 상속해 주었다.
	func channelUp() {
		// 이 tv에 동작하는 channelUp이 어떤 동작인지 구현해준다.
	}
	func channelDown() {
		// 이 tv에 동작하는 channelDown이 어떤 동작인지 구현해준다.
	}
}

let remote = RemoteControl() // 리모컨 객체
let samsungTV = TV() 
remote.delegate = samsungTV // 어떤 프로토콜을 쓸지 정해주는 것?이라고 생각하면 될 듯.
// 리모컨에 삼성을 쓰겠다고 말해주는 것.
// remote.channelUp()을 하면 TV의 channelUp이 실행
// remote.channelDown()을 하면 TV의 channelDown이 실행
```

- 위와같은 원리이기 때문에 텍스트 필드에 함수 구현만 해주면 작동이 바뀔 수 있는 것.

- 보통 이를 어떻게 실행하는 지 내부적 구현은 가려져 있다. (proprietary)
- 텍스트필드 또한 내부 구현은 숨겨져 있다.

[[ui_textfield]]
[[note_list_ios]]