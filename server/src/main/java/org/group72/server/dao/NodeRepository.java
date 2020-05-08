/**
 *  Decided to not use a node table at for the moment because making
 *  foreign keys with multiple values was a bit problematic in JPA,
 *  but we should look into it for the future.
 * @author Emil M.
 */




//package org.group72.server.dao;
//
//import org.springframework.data.repository.CrudRepository;
//
//public interface NodeRepository extends CrudRepository<Node, Double> {
//
////    @Query("SELECT n FROM Node n WHERE n.id = 13218186")
////    Iterable<Node> getNodesA();
////
////    @Query("SELECT n FROM Node n WHERE n.id > 13218180")
////    Iterable<Node> getNodesB();
////
////    @Query("SELECT n.longitude FROM Node n WHERE n.latitude = 59.3098 and n.longitude = 18.0922")
////    Iterable<Node> getNodesC();
////
////    @Query("SELECT n FROM Node n WHERE n.longitude = :longitude and n.latitude = :latitude")
////    Node getNode(@Param("longitude") double longitude, @Param("latitude") double latitude);
////
////    @Query("SELECT n FROM Node n WHERE n.id = :id")
////    Node getNode(@Param("id") int id);
//
//}