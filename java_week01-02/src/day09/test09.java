package day09;

public class test09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
Account account = new Account("Hong", "1002", 2000);
try {
	account.output(8000);
} catch (MoneyException e) {
	System.out.println(e.getMessage());	
}

	}

}

class MoneyException extends Exception{
	//사용자정의 Exception.
	//예외의 이름으로 어떤 에러인지 추측가능하게끔.
	//그냥 Exception 대체 할 때 쓴다.
	MoneyException(){
		super("low balance Occurs");
	}
	MoneyException(String msg){
		//에러의 가장 중요한 목적은 메세지 던지기
		super(msg);
				
	}
}


class Account{
	String name;
	String number;
	int money;
	
	
	public void input(int money){
		this.money += money;
	}
public void output(int money) throws MoneyException{
	//throws Exception = "이 method는 예외가 발생할 수 있습니다'락'.
	//catch는 여기서 하는게 아니라 이걸 호출하는 곳(main)에서 catch한다.
	//(에러)메세지를 클라이언트 화면에 뿌리냐, 서버 화면에 뿌리냐의 핸들링.
	if(this.money < money) throw new MoneyException("low balance"); 
		this.money -= money;
	}
	
	@Override
	public String toString() {
		return "Account [name=" + name + ", number=" + number + ", money=" + money + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + money;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((number == null) ? 0 : number.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Account other = (Account) obj;
		if (money != other.money)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (number == null) {
			if (other.number != null)
				return false;
		} else if (!number.equals(other.number))
			return false;
		return true;
	}
	public Account(String name, String number, int money) {
		super();
		this.name = name;
		this.number = number;
		this.money = money;
	}
	
}