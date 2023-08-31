// hard
// week 9 assignment P1
import java.util.Scanner;
public class PerniciousNumbers {
	
	public static String getBinaryString (int number) 
	{
		String binaryNumber = "";  // initialise an empty string
		while (number != 0) 
		{
			int remainder = number % 2;
			binaryNumber = remainder + binaryNumber;
			number /= 2;
		}
		return binaryNumber;
	}
	
	
	public static boolean isPernicious (int number) 
	{
		boolean numberIsPernicious = false;
	    String binaryNumberString = getBinaryString(number);
	    
	    if (binaryNumberString.isEmpty()) 
	    {
	        return false;  // check if string is empty
	    }
	    
	    int binaryNumber;
	    try
	    {
	        binaryNumber = Integer.parseInt(binaryNumberString, 2);
	    }
	    
	    catch (NumberFormatException e)
	    {
	        return false;
	    }
	    
		int numberOfOnes = countBinaryOnes (binaryNumber);
		if (isPrime(numberOfOnes))
		{
			numberIsPernicious = true;
		}
		else
		{
			numberIsPernicious = false;
		}
		
		return numberIsPernicious;
	}
	
	
	public static int countBinaryOnes (int number) 
	{
		int numberOfOnes = 0;
		String binaryNumber = getBinaryString(number);
		for (int i = 0; i < binaryNumber.length(); i++)
		{
			char digit = binaryNumber.charAt(i);
			if (digit == '1')
			{
				numberOfOnes ++;
			}
		}
		return numberOfOnes;
	}
	
	
	public static boolean isPrime (int number)
	{
		boolean numberIsPrime = true;
		if (number <= 1)
		{
			numberIsPrime = false;
		}
		else
		{
			for (int i = 2; i <= Math.sqrt(number); i++)
			{
				if (number % i == 0)
				{
					numberIsPrime = false;
					break;
				}
			}
		}
		
		return numberIsPrime;
	}

	
	public static void main(String[] args)
	{
		// TODO Auto-generated method stub
		Scanner input = new Scanner (System.in);
		System.out.println ("Enter the maximum number you want to consider:");
		int number = input.nextInt();
		for (int perniciousNo = 0; perniciousNo <= number; perniciousNo ++)
		{
			if (isPernicious(perniciousNo))
			{
				System.out.println (perniciousNo + " is a pernicious number as it contains " + countBinaryOnes(perniciousNo) + " ones in its binary representation (" + getBinaryString (perniciousNo) + ")");
			}
		}

		input.close();
	}

}
