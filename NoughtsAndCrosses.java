
import java.util.Scanner;
public class NoughtsAndCrosses
{
	public static final int NUMBER_OF_ROWS = 3;
	public static final int NUMBER_OF_COLUMNS = 3;
	public static final char BLANK_LOCATION = ' ';
	
	public static void clearBoard(char[][] board)
    {
		for (int row = 0; (row < board.length); row++)
		{
			for (int column = 0; (column < board[row].length); column++)
			{
				board[row][column] = BLANK_LOCATION;
			}
		}

    }
	
    public static void printBoard(char[][] board)
    {
		System.out.println("A " + board[0][0] + " | " + board[0][1] + " | " + board[0][2] + " ");
		System.out.println(" ---|---|---");
		System.out.println("B " + board[1][0] + " | " + board[1][1] + " | " + board[1][2] + " ");
		System.out.println(" ---|---|---");
		System.out.println("C " + board[2][0] + " | " + board[2][1] + " | " + board[2][2] + " ");
		System.out.println("  1   2   3 ");

    }
	
    public static boolean canMakeMove(char[][] board, int row, int column)
    {
    	boolean canMakeMove = false;
    	if (board[row][column] == BLANK_LOCATION)
    	{
    		canMakeMove = true;
    	}
    	else
    	{
    		canMakeMove = false;
    	}
       return canMakeMove;
    }
	
    public static void makeMove(char[][] board, char XO, int row, int column)
    {
    	if (board[row][column] == BLANK_LOCATION)
    	{
    		board[row][column] = XO;
    	}
    }
	
    public static boolean isBoardFull(char[][] board)
    {
    	boolean boardIsFull = false;
    	for (int row=0; (row < board.length); row++)
    	{
    		for (int column = 0; (column < board[row].length); column++)
    		{
    			if (board[row][column] == BLANK_LOCATION)
    			{
    				boardIsFull = false; //if any location is blank the board isnt full
    				break;  //// No need to continue checking remaining cells
    			}
    		}
    		if (!boardIsFull)
    		{
    			break; // // No need to check remaining rows if board is not full
    		}
    	}
    	return boardIsFull;
    }
	
    public static char winner(char[][] board)
    {
    	for (int i = 0; i < 3; i++)
    	{   
    		// for across wins
    		if((board[i][0] == board[i][1]) && (board[i][1] == board[i][2]))
    		{
    			return board[i][0];
    		}
    		// for down wins
    		else if ((board[0][i] == board[1][i]) && board[1][i] == board[2][i])
    		{
    			return board[0][i];
    		}
    	}
    	
    	// for diagonal wins
    	if ((board[0][0] == board[1][1]) && (board[1][1] == board[2][2]))
    	{
    		return board[0][0];
    	}
    	
    	else if ((board[2][0] == board[1][1]) && (board[1][1] == board[0][2]))
    	{
    		return board[2][0];
    	}
    	
		return ' ';

    }

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		Scanner input = new Scanner (System.in);
		NoughtsAndCrosses XO = new NoughtsAndCrosses();
		char[][] board = new char [NUMBER_OF_ROWS][NUMBER_OF_COLUMNS];
		//printBoard(board);
		XO.clearBoard(board);
		int count = 0;
		
		while(XO.isBoardFull(board) == false)
		{
			if(XO.winner(board) != ' ')
			{
				break; //end game
			}
			XO.printBoard(board);
			char currentPlayer;
			if (count % 2 == 0)
			{
				currentPlayer = 'X';
			}
			else
			{
				currentPlayer = 'O';
			}
		
		    System.out.print ("Enter move for " + currentPlayer + ": ");
		    String charMove = input.next();
		    System.out.println (charMove);
		    
		    int row = charMove.charAt(0) - 'A';
		    int column = charMove.charAt(1) - '1';
		    
		    XO.makeMove(board, currentPlayer, row, column);
		    count++;
		}
		
		

	}

}
