package org.group72.server.controller;

import net.minidev.json.JSONArray;
import org.group72.server.dao.EdgeRepository;
import org.group72.server.model.Edge;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * This class handles incoming requests regarding generation, viewing and storing routes
 * but should not handle any logic. Currently it handles a simple demo request so that
 * the dev team can discuss the structure of the data.
 * @author Emil M.
 */
@Controller
@RequestMapping(path="/route")
public class RouteController {
    @Autowired
    private EdgeRepository edgeRepository;

    /**
     * A demo route manually created.
     * @return An array of edges as JSON.
     */
    @GetMapping(path = "/demo")
    public @ResponseBody JSONArray demo(){

        JSONArray tmp = new JSONArray();
        //59.3121417  18.0911303 -> 59.3123095 18.0912094
        Edge e = edgeRepository.getEdge(59.3121417,18.0911303 ,59.3123095, 18.0912094);
        tmp.appendElement(e);
        e = edgeRepository.getEdge(e.getLatitude_B(), e.getLongitude_B(), 59.3126612, 18.0913751);
        tmp.appendElement(e);
        e = edgeRepository.getEdge(59.3126381, 18.0915173, e.getLatitude_B(), e.getLongitude_B() );
        tmp.appendElement(e);
        e = edgeRepository.getEdge( 59.312634, 18.0916134, e.getLatitude_A(), e.getLongitude_A());
        tmp.appendElement(e);
        e = edgeRepository.getEdge(59.3126498, 18.0916942, e.getLatitude_A(), e.getLongitude_A());
        tmp.appendElement(e);

        return tmp;
    }

}
