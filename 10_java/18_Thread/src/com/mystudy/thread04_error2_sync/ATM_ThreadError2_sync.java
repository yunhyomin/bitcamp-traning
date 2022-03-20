package com.mystudy.thread04_error2_sync;

class Bank {
	int money = 0;
}

class ATM extends Thread {
	Bank bank;
	String name;

	// 생성자(Construct)
	ATM(Bank bank, String name) {
		super(name);// 쓰레드명 전달
		this.bank = bank;
		this.name = name;
	}

	// 입금
	// synchronized(사용객체) {} : 사용객체(인스턴스) 동기화 처리
	void add(int money) {
		synchronized (bank) {
			bank.money += money;
			System.out.println(Thread.currentThread() + "입금:" + money + ", 잔액:" + bank.money);
		}
	}

	// 출금
	// synchronized(사용객체) {} : 사용객체(인스턴스) 동기화 처리
	void out(int money) {
		synchronized (bank) {
			bank.money -= money;
			System.out.println(Thread.currentThread() + "출금:" + money + ", 잔액:" + bank.money);
		}
	}

	void bankSleep(int millisecond) {
		try {
			Thread.currentThread().sleep(millisecond);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		add(1000);
		bankSleep(1000);
		out(500);
		bankSleep(1000);
		out(300);
		bankSleep(1000);
		out(200);
	}
}

public class ATM_ThreadError2_sync {

	// 메인메소드
	public static void main(String[] args) {
		System.out.println("----------ㅡmain()시작----------");
		Bank bank = new Bank();
		System.out.println("은행잔고 :" + bank.money);

		ATM atm1 = new ATM(bank, "ATM-1");// ATM기계 1
		atm1.start();

		ATM atm2 = new ATM(bank, "ATM-2");// ATM기계 2 기계1과 같은 계좌를 쓰고있다
		atm2.start();

		System.out.println("----------ㅡmain()끝----------");

	}

}
