package business.users;

public class Client extends User{
    private int id;

    public Client(int id, String username, char[] password) {
        super(username, password);
        this.id = id;
        this.role = Roles.CLIENT;
    }

    public int getID() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Roles getRole() {
        return role;
    }

    public void setRole(Roles role) {
        this.role = role;
    }
}
