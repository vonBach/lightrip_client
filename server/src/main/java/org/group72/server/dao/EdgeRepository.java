package org.group72.server.dao;

import org.group72.server.model.Edge;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface EdgeRepository extends CrudRepository<Edge, Integer> {

    /**
     * Fetches an edge where the positions matches corresponding column.
     * todo implement fetch that disregards the internal order of parameters.
     * @param lat_A
     * @param lon_A
     * @param lat_B
     * @param lon_B
     * @return
     */
    @Query("SELECT e "+
            "FROM Edge e " +
            "WHERE e.latitude_A = :lat_A " +
            "and e.longitude_A = :lon_A " +
            "and e.latitude_B = :lat_B " +
            "and e.longitude_B = :lon_B " )
    Edge getEdge(@Param ("lat_A") double lat_A, @Param ("lon_A") double lon_A, @Param ("lat_B") double lat_B, @Param ("lon_B") double lon_B);

}
