package day0707;
// 게시판 프로그램을 작성하시오.

// 게시글에는 번호, 제목, 작성자, 내용의 정보가 들어가야 하고
// 이 프로그램은 총 5개의 게시글을 관리할 수 있습니다.

// 3시 50분까지(쉬는 시간 포함)
import java.util.Scanner;
import util.ScannerUtil;

public class Board01 {
    // 상수
    // 총 저장 가능한 글의 갯수
    static final int BOARD_SIZE = 5;

    // 배열의 제목 인덱스
    static final int INDEX_TITLE = 0;

    // 배열의 작성자 인덱스
    static final int INDEX_WRITER = 1;

    // 배열의 내용 인덱스
    static final int INDEX_CONTENT = 2;

    public static void main(String[] args) {
        // 변수
        // Scanner 클래스 변수
        Scanner scanner = new Scanner(System.in);

        // 번호 배열
        int[] idArray = new int[BOARD_SIZE];

        // 제목, 작성자, 내용 배열
        String[][] boardArray = new String[BOARD_SIZE][3];

        // 다음에 입력할 인덱스
        int index = 0;

        while (true) {
            // 입력시 출력할 안내 문구를 저장할 변수
            String message;

            // 메뉴
            message = "1. 입력 2. 출력 3. 종료";
            int userChoice = ScannerUtil.nextInt(scanner, message, 1, 3);

            if (userChoice == 1) {
                // 게시글 입력 코드 구현

                if (index < BOARD_SIZE) {

                    // 번호 입력
                    message = "게시글 번호를 입력해주세요.";
                    idArray[index] = ScannerUtil.nextInt(scanner, message);

                    // 제목 입력
                    message = "게시글 제목을 입력해주세요.";
                    boardArray[index][INDEX_TITLE] = ScannerUtil.nextLine(scanner, message);

                    // 작성자 입력
                    message = "게시글 작성자를 입력해주세요.";
                    boardArray[index][INDEX_WRITER] = ScannerUtil.nextLine(scanner, message);

                    // 내용 입력
                    message = "게시글 내용을 입력해주세요.";
                    boardArray[index][INDEX_CONTENT] = ScannerUtil.nextLine(scanner, message);

                    // 다음 입력할 인덱스 1 증가
                    index++;
                } else {
                    System.out.println();
                    System.out.println("------------------------");
                    System.out.println("더 이상 입력하실 수 없습니다.");
                    System.out.println("------------------------");
                    System.out.println();
                }

            } else if (userChoice == 2) {
                // 게시글 출력 코드 구현
                if (index > 0) {
                    // 출력 메소드 호출
                    printAll(index, idArray, boardArray);

                } else {
                    // 아직 입력된 게시글이 존재하지 않으므로
                    // 경고 메시지만 출력
                    System.out.println();
                    System.out.println("------------------------");
                    System.out.println("아직 등록된 게시글이 없습니다.");
                    System.out.println("------------------------");
                    System.out.println();
                }

            } else if (userChoice == 3) {
                // 프로그램 종료 코드 구현
                System.out.println("사용해주셔서 감사합니다.");
                break;
            }
        }

        scanner.close();
    }

    public static void printAll(int index, int[] idArray, String[][] boardArray) {
        for (int i = 0; i < index; i++) {
            System.out.println();

            System.out.println("--------------------");
            System.out.println("제목: " + boardArray[i][INDEX_TITLE]);
            System.out.println("--------------------");
            System.out.printf("번호: %d 작성자: %s\n", idArray[i], boardArray[i][INDEX_WRITER]);
            System.out.println("--------------------");
            System.out.println(boardArray[i][INDEX_CONTENT]);

            System.out.println();
        }
    }

}
