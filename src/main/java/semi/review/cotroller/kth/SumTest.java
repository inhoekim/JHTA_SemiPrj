package semi.review.cotroller.kth;

import java.util.ArrayList;

public class SumTest {
	
	public static void main(String[] args) {
//		double sum = (5 + 3) / 2;
//		
//		System.out.println("sum : " + sum);
//		
//		double sum2 = (sum + 3) / 2;
//		System.out.println("sum2 : " + sum2);
//		
//		double sum3 = (sum2 + 4) / 2;
//		System.out.println("sum3 : " + sum3);
//		
//		double sum4 = (sum3 + 2) / 2;
//		System.out.println("sum4 : " + sum4);
//		
//		double sum5 = (sum4 + 5) / 2;
//		System.out.println("sum5 : " + sum5);
		
//		String path = "C:\\2107\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semiPrj\\images\\img.png";
//		String change = path.replace("\\", "/");
//		String fi = change.substring(change.lastIndexOf("/semi"));
//		System.out.println("체인지 : " + fi);
		
		String keyword = "title_content";
		ArrayList<String> list = new ArrayList<String>(); 
		String ch = keyword.substring(keyword.lastIndexOf("_") + 1);
		String ch2 = keyword.substring(0, keyword.indexOf("_"));
		list.add(ch);
		list.add(ch2);
		
		for (String a : list) {
			System.out.println(a);
		}
		
		System.out.println("ch : " + ch);
		System.out.println("ch2 : " + ch2);
		
	}
	
}
