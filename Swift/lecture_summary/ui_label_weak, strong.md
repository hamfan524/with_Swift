tags: #ios #ui #uikit #label #레이블

# Contents
- weak: 약한 참조
	- 서로를 가리킬 가능성을 없앤다(?)   
	- strong cycle의 가능성을 없앤다. 위와 같은 말이긴 함

- strong: 강한 참조
	- subView가 view에 할당되어 있는 경우
		- VC가 subView를 소유하므로 subView: 1
		- VC가 view를 소유하므로 view: 1, subView: 1
		- view가 subView를 소유하므로 view: 1, subView: 2
	- 위의 상황에서 메모리부족으로 didReceiveMemoryWarning이 호출 될 경우 view가 해제된다.
		- VC가 view 소유, view가 subView소유하므로 상승한 RC가 내려가므로 view: 0, subView: 1
		- subView가 해제되지 않은 상태가 된다. (메모리 누수 발생)


[[note_list_ios]]