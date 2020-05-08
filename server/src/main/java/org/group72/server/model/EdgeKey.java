package org.group72.server.model;


import java.io.Serializable;
import java.util.Objects;

/**
 * This class is required by JPA for the use of a composed key in the Edge table.
 * @author Emil M.
 */
public class EdgeKey implements Serializable {
    private double latitude_A;
    private double longitude_A;
    private double latitude_B;
    private double longitude_B;

    //The default constructor is required by JPA and should not be removed
    public EdgeKey() {
    }

    public double getLatitude_A() {
        return latitude_A;
    }

    public void setLatitude_A(double latitude_A) {
        this.latitude_A = latitude_A;
    }

    public double getLongitude_A() {
        return longitude_A;
    }

    public void setLongitude_A(double longitude_A) {
        this.longitude_A = longitude_A;
    }

    public double getLatitude_B() {
        return latitude_B;
    }

    public void setLatitude_B(double latitude_B) {
        this.latitude_B = latitude_B;
    }

    public double getLongitude_B() {
        return longitude_B;
    }

    public void setLongitude_B(double longitude_B) {
        this.longitude_B = longitude_B;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EdgeKey edgeKey = (EdgeKey) o;
        return Double.compare(edgeKey.latitude_A, latitude_A) == 0 &&
                Double.compare(edgeKey.longitude_A, longitude_A) == 0 &&
                Double.compare(edgeKey.latitude_B, latitude_B) == 0 &&
                Double.compare(edgeKey.longitude_B, longitude_B) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(latitude_A, longitude_A, latitude_B, longitude_B);
    }
}
