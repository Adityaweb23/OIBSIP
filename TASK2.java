package Aself;
import java.util.Scanner;

	import java.util.Scanner;

	public class TASK2 {

		public static void guessingNumberGame(){
			Scanner sc = new Scanner(System.in);

			int number = 1 + (int)(100
								* Math.random());

			int K = 7;

			int i, trye;

			System.out.println(
				"There is anumber hiding between 1 to 100. take on the challenge and try to guess the number you will get 7 trials.");

			for (i = 0; i < K; i++) {

				System.out.println(
					"guess the number:");

				trye = sc.nextInt();
				if (number == trye) {
					System.out.println(
						"Congratulations!"
						+ " You guessed the number. You took just [["+ (i+1) +"]] tries to guess the number thus you have eared <<" + ((K-(i+1))*100) + ">> points outoff 700 points");
					break;
				}
				else if (number > trye
						&& i != K - 1) {
					System.out.println(
						"The number is "
						+ "greater than " + trye);
				}
				else if (number < trye
						&& i != K - 1) {
					System.out.println(
						"The number is"
						+ " less than " + trye);
				}
			}

			if (i == K) {
				System.out.println(
					"You have exhausted"
					+ " K trials.");

				System.out.println(
					"The number was " + number);
				
			}
		}

		

	public static void main(String args[]) {
		int n=1;
		Scanner scan =new Scanner(System.in);
		while(n==1) {
			
		guessingNumberGame();
		System.out.println("if you want to continue press 1");
		System.out.println("if you want to exit press 0");
		n=scan.nextInt();
		}
			System.out.println("Thanks for playing the game");
	}
	
}