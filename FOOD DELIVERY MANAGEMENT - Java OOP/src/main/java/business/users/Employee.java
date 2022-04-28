package business.users;

public class Employee extends User{

    public Employee(String username, char[] password) {
        super(username, password);
        role = Roles.EMPLOYEE;
    }
}
