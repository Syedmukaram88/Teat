import java.io.*;
class PrimePal
{
	public void prime(int n)
	{
		int x=0;
		for(int i=1;i<n;i++)
			{
			if(n%i==0)
				x++;
			}
		if(x>1)
			System.out.println("The no. is not Prime");
		else
			System.out.println("The no. is Prime");
	}
	public void pal(int n)
	{
		int x,sum=0;
		x=n;
		do
			{
			sum=sum*10+x%10;
			x=x/10;
			}while(x!=0);
		System.out.println(sum);
		if(sum==n)
			System.out.println("The no. is Palindrome");
		else
			System.out.println("The no. is not Palindrome");
	}
}
class Mythread extends Thread
{
	int n1;
	Mythread(int n)
	{
	n1=n;	
	}
	public void run()
	 {
		PrimePal p=new PrimePal();
		 String name=Thread.currentThread().getName();
		 if(name.equals("One"))
		 {
			 p.prime(n1);
			 }
		if(name.equals("Two"))
		 {p.pal(n1);} 
			 
		}
}
public class Thprpl {

	/**
	 * @param args
	 */
	public static void main(String[] args)throws Exception {
		// TODO Auto-generated method stub

	System.out.println("Enter the no.:");
	BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
	int n=Integer.parseInt(br.readLine());
	Mythread t1=new Mythread(n);
	Mythread t2=new Mythread(n);
	t1.setName("One");
	t2.setName("Two");
	t1.start();
	t2.start();
	}

}
