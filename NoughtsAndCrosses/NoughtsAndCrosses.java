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
	
	
    public static boolean canMakeMove(char[][] board, int row, int column)
    {
    	boolean ableToMakeMove = false;
    	if (board[row][column] == BLANK_LOCATION)
    	{
    		ableToMakeMove = true;
    	}
    	else
    	{
    		ableToMakeMove = false;
    	}
    	
       return ableToMakeMove;
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
    	for (int row = 0; (row < board.length); row++)
    	{
    		for (int column = 0; (column < board[row].length); column++)
    		{
    			if (board[row][column] == BLANK_LOCATION)
    			{
    				boardIsFull = false; 
    				break; 
    			}
    		}
    		if (!boardIsFull)
    		{
    			break; 
    		}
    	}
    	
    	return boardIsFull;
    }
	
    
    public static char winner(char[][] board)
    {
    	for (int i = 0; i < 3; i++)
    	{   
    		// horizontal wins
    		if((board[i][0] == board[i][1]) && (board[i][1] == board[i][2]))
    		{
    			return board[i][0];
    		}
    		// vertical wins
    		else if ((board[0][i] == board[1][i]) && (board[1][i] == board[2][i]))
    		{
    			return board[0][i];
    		}
    	}
    	
    	// diagonal wins
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
    
    
    public static void printBoard(char[][] board)
    {
		System.out.println("A " + board[0][0] + " | " + board[0][1] + " | " + board[0][2] + " ");
		System.out.println(" ---|---|---");
		System.out.println("B " + board[1][0] + " | " + board[1][1] + " | " + board[1][2] + " ");
		System.out.println(" ---|---|---");
		System.out.println("C " + board[2][0] + " | " + board[2][1] + " | " + board[2][2] + " ");
		System.out.println("  1   2   3 ");
    }

    
	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		Scanner input = new Scanner (System.in);
		NoughtsAndCrosses XO = new NoughtsAndCrosses();
		char[][] board = new char [NUMBER_OF_ROWS][NUMBER_OF_COLUMNS];
		XO.clearBoard(board);
		int count = 0;
		
		while(XO.isBoardFull(board) == false)
		{
			if(XO.winner(board) != ' ')
			{
				break; 
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
		    String characterMove = input.next();
		    System.out.println (characterMove);
		    
		    int row = characterMove.charAt(0) - 'A';
		    int column = characterMove.charAt(1) - '1';
		    
		    XO.makeMove(board, currentPlayer, row, column);
		    count++;
		}
		
		input.close();
	}

}