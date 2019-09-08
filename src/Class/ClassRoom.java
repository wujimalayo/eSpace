package Class;

public class ClassRoom {
	private String clsname;//教室名字或编号
	private String building;//教学楼名字
	private int floor;//楼层
	private String status;//状态
	public String getClsname() {
		return clsname;
	}
	public void setClsname(String clsname) {
		this.clsname = clsname;
	}
	public String getBuilding() {
		return building;
	}
	public void setBuilding(String building) {
		this.building = building;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	/*public ClassRoom(String clsname,String building,int floor,String status) {
		super();
		this.clsname=clsname;
		this.building=building;
		this.floor=floor;
		this.status=status;
	}*/
}
