package org.group72.server.model;

import com.jayway.jsonpath.JsonPath;


/**
 * Used to parse the data from Stockholm stad to parse data
 * for geographical positions.
 */
public class JSONMapReader {

    /**
     * Goes through the whole JSON file and creates nodes and edges.
     */
    public void read(String filePath) {


    }


    /**
     * Converts a single JSON line into nodes and edges.
     */
    private void readLine(String json){
        Integer points = JsonPath.read(json, "$.geometry.coordinates");
        System.out.println(points);

        for(int i=0; i < points; i++) {
            String point = JsonPath.read(json, "$.coordinates[" + i + "].post_id");
            System.out.println(post_id);
        }
    }
}
