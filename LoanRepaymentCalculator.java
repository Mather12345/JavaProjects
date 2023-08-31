import java.util.Scanner;
public class LoanRepaymentCalculator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner input = new Scanner (System.in);
		System.out.println ("Enter loan amount?");
//		int loanAmount = input.nextInt();
		double loanAmount = input.nextDouble();
		System.out.println ("Enter annual interest rate (e.g. 0.04)?");
		double annualInterestRate = input.nextDouble();
		System.out.println ("Enter the term of the loan in years?");
//		int loanInYears = input.nextInt();
		double loanInYears = input.nextDouble();
		
		double monthlyInterestRate = annualInterestRate / 12;
//		int loanInMonths = loanInYears * 12;
		double loanInMonths = loanInYears * 12;
		
		double monthlyRepaymentAmount = loanAmount * ((monthlyInterestRate * Math.pow(1 + monthlyInterestRate,loanInMonths) / 
				Math.pow(1 + monthlyInterestRate, loanInMonths) - 1));
		
		System.out.printf("The monthly repayment for a %.0f year loan of %.2f at an annual interest rate of %.2f would be %.2f",
				loanInYears, loanAmount, annualInterestRate, monthlyRepaymentAmount);

	}

}
