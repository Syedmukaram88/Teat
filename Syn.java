class Demo
{
	synchronized void show(int n)
	{
		try
		{
		for(int i=0;i<=5;i++)
		{
			
			System.out.println(n*i);
		
		Thread.sleep(4000);
		}
		}
	catch(InterruptedException ex)
	{
		ex.getMessage();
		}
	}
}
class MyThread1 extends Thread
{
	Demo d;
	MyThread1(Demo d)
	{
		this.d=d;
	}
	public void run()
	{
		d.show(5);
	}
}
class MyThread2 extends Thread
{

	Demo d;
	MyThread2(Demo d)
	{
		this.d=d;
	}
	public void run()
	{
		d.show(100);
	}
}
public class Syn {



	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	Demo obj=new Demo();
	MyThread1 t1=new MyThread1(obj);
	MyThread2 t2=new MyThread2(obj);
	t1.start();
	t2.start();
	}

}
