package day08;

public class test05 {
	public static void main(String[] args) {
		Account a1 = new Account("Kim", "001", 300);
		Account a2 = new Account("Lee", "002", 400);
		Account a3 = new Account("Lee", "002", 400);
System.out.println(a1);
System.out.println(a2);

System.out.println(a1.equals(a2));
System.out.println(a2.equals(a3));
	}

}

class Account extends Object{
	String name;
	String number;
	int Money;
	
	public Account() {
		super();
	}
	public Account(String name, String number, int money) {
		super();
		this.name = name;
		this.number = number;
		this.Money = money;
	}
	
	
	@Override
	public String toString() {
		return "Account [name=" + name + ", number=" + number + ", Money=" + Money + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Money;
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
		if (Money != other.Money)
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
	
	
}

