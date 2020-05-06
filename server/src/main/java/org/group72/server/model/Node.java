package org.group72.server.model;

/**
 * Node represents a geographical position on the map
 * and has at least one edge.
 */
public class Node {

    private final int longitude;
    private final int latitude;

    public Node(int longitude, int latitude) {
        this.longitude = longitude;
        this.latitude = latitude;
    }

    public int getLongitude() {
        return longitude;
    }

    public int getLatitude() {
        return latitude;
    }
}
