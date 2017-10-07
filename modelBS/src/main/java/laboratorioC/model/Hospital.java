package laboratorioC.model;

public class Hospital {

	private final String name;
	private final String address;
	private final int latitude;
	private final int longitude;
	
	public Hospital(final String name, final String address, final int latitude, final int longitude) {
		this.name = name;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public int getLatitude() {
		return latitude;
	}

	public int getLongitude() {
		return longitude;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + latitude;
		result = prime * result + longitude;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Hospital))
			return false;
		Hospital other = (Hospital) obj;
		if (latitude != other.latitude)
			return false;
		if (longitude != other.longitude)
			return false;
		return true;
	}
}
