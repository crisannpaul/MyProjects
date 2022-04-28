package business.users;

public class Admin extends User{

    public Admin(String username, char[] password) {
        super(username, password);
        this.role = Roles.ADMIN;
    }
}
