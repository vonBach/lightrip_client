//  rudely stolen from http://www.jsonschema2pojo.org/  /Ida
import java.util.List;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "type",
        "properties",
        "geometry"
})
public class LightNode {

    @JsonProperty("type")
    private String type;
    @JsonProperty("properties")
    private Properties properties;
    @JsonProperty("geometry")
    private Geometry geometry;

    @JsonProperty("type")
    public String getType() {
        return type;
    }

    @JsonProperty("type")
    public void setType(String type) {
        this.type = type;
    }

    @JsonProperty("properties")
    public Properties getProperties() {
        return properties;
    }

    @JsonProperty("properties")
    public void setProperties(Properties properties) {
        this.properties = properties;
    }

    @JsonProperty("geometry")
    public Geometry getGeometry() {
        return geometry;
    }

    @JsonProperty("geometry")
    public void setGeometry(Geometry geometry) {
        this.geometry = geometry;
    }

}

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "type",
        "coordinates"
})
public class Geometry {

    @JsonProperty("type")
    private String type;
    @JsonProperty("coordinates")
    private List<Double> coordinates = null;

    @JsonProperty("type")
    public String getType() {
        return type;
    }

    @JsonProperty("type")
    public void setType(String type) {
        this.type = type;
    }

    @JsonProperty("coordinates")
    public List<Double> getCoordinates() {
        return coordinates;
    }

    @JsonProperty("coordinates")
    public void setCoordinates(List<Double> coordinates) {
        this.coordinates = coordinates;
    }

}

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "DP_oid",
        "Stadie",
        "Placering",
        "Drifttagen",
        "Omgivning"
})
public class Properties {

    @JsonProperty("DP_oid")
    private double dPOid;
    @JsonProperty("Stadie")
    private String stadie;
    @JsonProperty("Placering")
    private String placering;
    @JsonProperty("Drifttagen")
    private String drifttagen;
    @JsonProperty("Omgivning")
    private String omgivning;

    @JsonProperty("DP_oid")
    public double getDPOid() {
        return dPOid;
    }

    @JsonProperty("DP_oid")
    public void setDPOid(double dPOid) {
        this.dPOid = dPOid;
    }

    @JsonProperty("Stadie")
    public String getStadie() {
        return stadie;
    }

    @JsonProperty("Stadie")
    public void setStadie(String stadie) {
        this.stadie = stadie;
    }

    @JsonProperty("Placering")
    public String getPlacering() {
        return placering;
    }

    @JsonProperty("Placering")
    public void setPlacering(String placering) {
        this.placering = placering;
    }

    @JsonProperty("Drifttagen")
    public String getDrifttagen() {
        return drifttagen;
    }

    @JsonProperty("Drifttagen")
    public void setDrifttagen(String drifttagen) {
        this.drifttagen = drifttagen;
    }

    @JsonProperty("Omgivning")
    public String getOmgivning() {
        return omgivning;
    }

    @JsonProperty("Omgivning")
    public void setOmgivning(String omgivning) {
        this.omgivning = omgivning;
    }
}

