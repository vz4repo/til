package day08;

import javax.xml.crypto.Data;

public class test08 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Drawable[] s = { new Circle(), new Rectangle()};
		for(Drawable data :s) {
			data.Draw();
			((Moveable)data).Move();
		}
		
		//T로 통합
		T[] t = {new Circle(), new Rectangle()};
		for (T data:t) {
			data.Draw();
			data.Move();
		}
		
	}
}



interface Drawable{
	void Draw();
}
interface Moveable{
	void Move();
}

//Drawable, Moveabl T로 통합

interface T extends Drawable, Moveable{}
class Circle implements Drawable, Moveable, T{
	String name = "Circles";
	@Override
	public void Move() {
System.out.println(name+"  이동(MOVE)");		
	}

	@Override
	public void Draw() {
		System.out.println(name+"  그리기(DRAW)");
	}
}

class Rectangle  implements Drawable, Moveable, T{
	
	String name = "Rectangles";
	@Override
	public void Move() {
System.out.println(name+"  이동(MOVE)");		
	}

	@Override
	public void Draw() {
		System.out.println(name+"  그리기(DRAW)");
		
	}
}