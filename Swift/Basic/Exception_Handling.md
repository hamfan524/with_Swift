# 예외처리
>-오류표현<br>
Error 프로토콜과 (주로) 열거형을 통해서 오류를 표현합니다.

## 1. 오류의 종류 정의하기(선택사항)

```Swift
enum 오류종류이름: Error {
    case 종류1
    case 종류2
    case 종류3
    // ...
}
```
오류 종류를 enum(열거형)으로 정의합니다.

### 📌 예시
```Swift
enum OpenError: Error{
    case outOfRange                         //1
    case invalidInput(invalidValue: String)       //2
}
```
1번은 기본적인 enum 케이스이고  
2번은 parameter를 받는 케이스입니다.

오류 종류 정의하기는 '선택사항'이기 때문에 간단하게 에러만 출력하는 상황에선 건너뛰어도 됩니다.

## 2. 발생한 오류 던지기
>오류 발생의 여지가 있는 메서드는 **throws**를 사용하여 오류를 내포하는 함수임을 표시합니다.
```
오류를 던진다 = 오류를 처리하는 곳으로 전달한다.
```
### 📌 예시

```Swift
class DoorLock{
    let masterKeyValue: String = "abc111"

    func UnLock(_ inputValue: String) throws -> String {
        // 입력 값이 없으면 오류를 던집니다.
        guard inputValue.count < 1 else{
            throw LoginError.outOfRange
        }
        // 입력한 텍스트가 inputValue 다르면 오류를 던집니다
        guard inputValue != masterKeyValue else{
            throw LoginError.invalidInput(invalidValue: inputValue)
        }

        // 오류가 없으면 정상처리를 합니다
        self.openStatus = true
        return print("잠금장치가 열렸습니다.")
    } 
}
```
1. 첫번째 **throws**는 오류가 발생할 가능성이 있는 메소드 제목 옆에 써줍니다.
2. 두번째 **throw**('s' 없음)은 오류가 발생할 구간에서 써줍니다.

그리고 **throw**는 오류를 던지면서 메서드를 바로 종료해주기 때문에 반환타입이 **String**이지만 반환하지않고 종료합니다.

## 3. 던진 오류 처리하기
> 오류 발생의 여지가 있는 **throws** 함수(메서드)는  
**try**를 사용하여 호출해야합니다.  
**try, try? try!**

>오류발생의 여지가 있는 **throws** 함수(메서드)는  
**do-catch** 구문을 활용하여 오류발생에 대비합니다.

### 📌 예시
```Swift
// 도어락 머신 인스턴스
let machine: DoorLock = DoorLock()

// 결과를 전달받을 변수
var result: String?

do{
    try machine.inputValue("abc123")
} catch OpenError.outOfRange{
    print("입력이 잘못되었습니다.")
} catch OpenError.invalidInput(let inputValue){
    print("\(inputValue)는 비밀번호가 아닙니다.")
} // abc123는 비밀번호가 아닙니다.
```
위에서 오류 케이스를 나누어 주었으니 정의한 케이스별로 처리해줍니다.

```Swift
do{
    try machine.inputValue("")
} catch /*(let error)*/ {
    switch error{
    case OpenError.outOfRange:   
        print("입력이 잘못되었습니다.")
    case OpenError.invalidInput(let inputValue):
        print("\(inputValue)는 비밀번호가 아닙니다.")
    default:
        print("알수없는 오류 \(error)")
    }
} // 입력이 잘못되었습니다.
```
케이스별로 처리하기 때문에 **switch**문으로도 표현 가능합니다.

```Swift
do{
    result = try machine.UnLock("")
} catch {
    print(error)
} //outOfRange


do{
    result = try machine.UnLock("bca111")
} //오류만 잡고 핸들링 하지 않는 경우
```
또 굳이 하나하나의 에러를 핸들링할 필요가 없을 시엔 이렇게 표현도 가능합니다.
### **try?** 와 **try!**
>**try?**  
별도의 오류처리 결과를 통보받지 않고  
오류가 발생했으면 결과값을 nil로 돌려받을 수 있습니다.  
정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌려 받습니다.
```Swift
result = try? machine.UnLock("abc111")
result // Opthonal("잠금장치가 열렸습니다.")

result = try? machine.UnLock("abc123")
result // nil
```
**unLock**에서 오류가 발생할 수 도 있다는 걸 인정하는 경우에 사용합니다.  
**Swift**에서 **물음표**는 **옵셔널**을 의미합니다.  
따라서 **result**가 리턴값을 **옵션널 타입** 또는 **nil**로 받을 수 있게 됩니다.
>**try!**  
오류가 발생하지 않을 것이라는 강력한 확신을 가질 때  
**try!**를 사용하면 정상동작 후에 바로 결과값을 돌려받습니다  
오류가 발생하면 런타임 오류가 발생하여  
애플리케이션 동작이 중지됩니다.
```Swift
result = try! machine.UnLock("abc111")
result // 잠금장치가 열렸습니다.

result = try! machine.UnLock("abc123") // 런타임 오류 -> 중지
```
오류가 절대로 발생하지 않을 자신이 있으면 사용하지만 추천하지 않습니다.
