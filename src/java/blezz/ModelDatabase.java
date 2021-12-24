/*What this page does? Defines the getters and setters for Databasedao
 * Date Created :10-06-2020
 * Created By:-Tapswi Godara
 * 
 */
package blezz;



public class ModelDatabase {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String name;
	private String emailId;
        private String lastName;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
        public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String eMailId) {
		this.emailId = eMailId;
	}
	
	
}