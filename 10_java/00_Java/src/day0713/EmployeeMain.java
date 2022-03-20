package day0713;

import java.util.Scanner;
import java.util.ArrayList;
import util.ScannerUtil;
import type.Employee;

public class EmployeeMain {
    private static Scanner scanner = new Scanner(System.in);
    private static ArrayList<Employee> list = new ArrayList<>();
    private static int nextId = 1;
    
    public static void main(String[] args) {
        //메뉴메소드 호출
        showMenu();
    }
    
    private static void showMenu() {
        String message = new String("1.입력 2. 출력 3. 종료");
        while(true) {
            int userChoice = ScannerUtil.nextInt(scanner, message,1,3);
            
            if(userChoice == 1) {
                insert();
            }else if(userChoice ==2) {
                printAll();
            }else if(userChoice ==3) {
                System.out.println("사용해주셔서 감사합니다\n 프로그램을 종료합니다.");
                break;
            }
        }
    }
    
    private static void insert() {
        //정보를 담을 Employee객체 생성
        Employee e= new Employee();
        //입력시 출력할 메시지를 담을 String객체 생성
        String message = new String("사원의 이름을 입력해주세요.");
        //Employee객체에 id저장
        e.setId(nextId++);
        //Employee객체에 이름저장
        e.setName(ScannerUtil.nextLine(scanner, message));
        //Employee객체에 부서저장
        message = new String("사원의 부서를 입력해주세요.");
        e.setTeam(ScannerUtil.nextLine(scanner, message));
        //Employee객체에 직급저장
        message = new String("사원의 직급을 입력해주세요");
        e.setPosition(ScannerUtil.nextLine(scanner, message));
        //Employee객체에 연봉저장
        e.setSalary(ScannerUtil.nextInt(scanner, message));
        //Employee객체를  list에 저장
        list.add(e);
        
    }
    
    private static void printAll() {
        if(list.isEmpty()) {
            System.out.println("아직 입력된 사원정보가 존재하지않습니다.");
        }else {
        String message= 
                new String("상세보기할 사원의 번호나 뒤로가시려면 0을 눌러주세요.");
        for(int i=0; i<list.size(); i++) {
            System.out.printf("%d. $s 사원\n",list.get(i).getId(),list.get(i).getName());
        }
    
    int userChoice = ScannerUtil.nextInt(scanner, message);
    
    while(selectById(userChoice) == null && userChoice != 0) {
        System.out.println("잘못 입력하셨습니다.");
        userChoice = ScannerUtil.nextInt(scanner, message);
    }
    
    if(userChoice != 0) {
        printOne(userChoice);
    }
    
}
}
    //사용자가 입력한 사원번호와 일치하는 리스트 객체를 리턴해주는 메소드
    //단, 일치하는 사원이 존재하지 않을때에는 null을 리턴 해준다.
    
    private static Employee selectById(int id) {
        Employee e = new Employee();
        e.setId(id);
        int index = list.indexOf(e);
        
        if(index != -1) {
            return list.get(index);
        }
        return null;
    }
    
    
    
    private static void printOne(int id) {
        
        //파라미터로 들어온 id값을 사용하여 
        //일치하는 Employee객체를 불러온다
        Employee e= selectById(id);
        e.printInfo();
        
        String message = new String("1.수정 2.삭제 3.뒤로가기");
        
        int userChoice = ScannerUtil.nextInt(scanner, message,1,3);
        if(userChoice ==1) {
            upDate(id);
        }else if(userChoice ==2) {
            delete(id);
        }else if(userChoice ==3) {
            printAll();
        }
    }
    
    private static void upDate(int id) {
        //수정 시 출력될 메시지를 저장할 String 객체
        String message;
        //파라미터로 들어온 id와 일치하는 Employee객체
        Employee e= selectById(id);
        
        //부서수정
        message= new String("새로운 부서를 입력해주세요");
       e.setTeam(ScannerUtil.nextLine(scanner, message));
        //직급수정
        message= new String("새로운 직급를 입력해주세요");
        e.setPosition(ScannerUtil.nextLine(scanner, message));
        //연봉수정
        message= new String("새로운 연봉를 입력해주세요");
        e.setSalary(ScannerUtil.nextInt(scanner, message));
        
        printOne(id);
    }
    
   private static void delete(int id) {
       Employee e = selectById(id);
       String message= new String ("정말로 삭제하시겠습니까? y/n");
       String yesNo = ScannerUtil.nextLine(scanner, message);
       if(yesNo.equalsIgnoreCase("y")) {
           list.remove(e);
           printAll();
       }else {
           printOne(id);
       }
       
   }
}























