package type;

public class Employee {
	
    //필드 
    //사원번호
	private int id;
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	//사원이름
	private String name;
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	//사원부서
	private String team;
	public void setTeam(String team) {
		this.team = team;
	}
	public String getTeam(String team) {
		return team;
	}
	//사원직급
	private String position;
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPosition(String position) {
		return position;
	}
	//사원연봉
	private int salary;
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getSalary(int salary) {
		return salary;
	}
	
	//equals()
	public boolean equals(Object o) {
	    if(o instanceof Employee) {
	        Employee e = (Employee)o;
	        
	        if(id == e.id) {
	            return true;
	        }
	    }
	    
	    return false;
	    
	}
	//printInfo()
	public void printInfo() {
	    System.out.println("--------------------------------");
	    System.out.println(name +"사원정보");
	    System.out.println("--------------------------------");
	    System.out.printf("사원번호: %d 사원이름: %s\n", id,name);
	    System.out.printf("사원부서: %s 사원직급: %s\n",team,position);
	    System.out.printf("사원연봉: %s\n",salary);
	    System.out.println("---------------------------------");

	}
}


































