public class StackTest{
	//java.util.Stack class는 사용하지 않는다.
	public static void main(String[] args) {
		MyStack stack = new MyStack(10);
		if(stack.isEmpty()){
			System.out.println("스택이 비어있습니다.");
		}
		
		for (int i = 1; i <= 10; i++) {
			stack.push(i);
		}
		
		if(stack.isFull()){
			System.out.println("스택이 가득 찼습니다.");
		}
		
		System.out.println("최상위 숫자 : " + stack.top());
		System.out.println("최상위에서 꺼낸 숫자 : " + stack.pop());
		System.out.println("최상위에서 꺼낸 숫자 : " + stack.pop());
		System.out.println("");
		System.out.println("== 스택 리스트 ==");
		for (int i = 1; i <= 10; i++) {
			int num = stack.pop();
			if(num != -1)
				System.out.println(num);
		}
	}
}

class MyStack{
	public void push(int i) {
		int [] num = new int[push(i)];
		//Stack에 정수를 저장한다.
	}
	public boolean isEmpty() {
		return true;
		//Stack이 비어있는지 확인할 수 있다. 
	}
	public boolean isFull() {
		return true;
		//Stack이 가득찼는지 확인할 수 있다. 
	}
	public void top() {
		
		//Stack에서 최상위에 저장된 숫자가 뭔지 알 수 있다.
		//top() 메서드를 호출했다고 해서 숫자가 삭제되는 것은 아니다.
		//꺼낼 숫자가 없는 경우 -1을 리턴한다.
	}
	public void pop() {
		//Stack에서 최상위에 저장된 숫자를 꺼낼 수 있다.
		//스택에서 숫자를 꺼내면 그 숫자는 Stack에서 삭제된다.
		//꺼낼 숫자가 없는 경우 -1을 리턴한다.
	}

}

/*
 * 결과값
 * 
 스택이 비어있습니다. 
스택이 가득 찼습니다.
최상위 숫자 : 10
최상위에서 꺼낸 숫자 : 10
최상위에서 꺼낸 숫자 : 9

== 스택 리스트 ==
8
7
6
5
4
3
2
1

 * */
