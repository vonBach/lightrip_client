package org.group72.server.model;

/**
 * An undirected edge connecting with two nodes.
 * Holds it's own distance and density of lights.
 */
public class Edge {
    /**
     * list of the two nodes.
     */
    private Node[] nodes = new Node[2];

    /**
     * The distance between the nodes in meters.
     * Can be calculated when requested and saved for later purpuses.
     */
    private double distance;

    /**
     * Get-method that calculates and returns and distance of the two nodes.
     * @returns double representation of the distance in meters
     */
    public double getDistance(){
        return calculateDistace(
                nodes[0].getLatitude(),
                nodes[0].getLongitude(),
                nodes[1].getLatitude(),
                nodes[1].getLongitude()
        );
    }

    /**
     * Calculates the distance between the nodes
     * as a positive value in meters.
     * @return double distance in meters
     */
    private static int calculateDistace(int lat1, int lon1, int lat2, int lon2){
        double radius = 6378.137; // Radius of earth in KM
        double dLat = lat2 * Math.PI / 180 - lat1 * Math.PI / 180;
        double dLon = lon2 * Math.PI / 180 - lon1 * Math.PI / 180;
        double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
                        Math.sin(dLon/2) * Math.sin(dLon/2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        double d = radius * c;
        return (int) d * 1000; // meters
    }


    /**
     * Creating an edge between two nodes.
     * @param n1 any node != n2.
     * @param n2 any node != n1.
     * @throws IllegalArgumentException if n1 and n2 are the same node.
     */
    public Edge(Node n1, Node n2) throws IllegalArgumentException{
        connect(n1, n2);
    }

    /**
     * Connects two nodes without internal order
     * @param n1 any node except for b.
     * @param n2 any node except for a.
     */
    private void connect(Node n1, Node n2){
        if(n1 == n2)
            throw new IllegalArgumentException("Creating an edge for a single node is not allowed.");
        nodes[0] = n1;
        nodes[1] = n2;
    }


}
