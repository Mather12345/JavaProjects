import java.util.Scanner;

public class Matrix 
{
	
	public static int[][] transposeMatrix (int[][] twoDArray)
	{
		int numOfRows = twoDArray.length;
		int numOfCols = twoDArray[0].length;
		
		int[][] transposeMatrix = new int [numOfCols][numOfRows];
		
		for (int r = 0; r < twoDArray.length; r++)
		{
			for (int c = 0; c < twoDArray[r].length; c++)
			{
				transposeMatrix[c][r] = twoDArray[r][c];
			}
		}
		
		return transposeMatrix;
	}

	public static void main(String[] args) 
	{
		Scanner input = new Scanner (System.in);
		System.out.println ("Enter the number of rows");
		int numOfRows = input.nextInt();
		System.out.println ("Enter the number of columns");
		int numOfCols = input.nextInt();
		
		int[][] matrix = new int [numOfRows][numOfCols];
		
		System.out.println ("Enter the matrix elements seperated my spaces: ");
		for (int r = 0; r < numOfRows; r++)
		{
			for (int c = 0; c < numOfCols; c++)
			{
				matrix[r][c] = input.nextInt();
			}
		}
		
		int[][] transposedMatrix = transposeMatrix (matrix);
		
		System.out.println ("Transposed Matrix is :");
		for (int r = 0; r < transposedMatrix.length; r++)
		{
			for (int c = 0; c < transposedMatrix[r].length; c++)
			{
				System.out.print(transposedMatrix[r][c] + " ");
			}
			System.out.println ();
		}
		

	}

}
