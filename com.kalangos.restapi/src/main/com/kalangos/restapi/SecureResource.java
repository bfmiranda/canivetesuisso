package canivetesuisso.com.kalangos.restapi.com.kalangos.restapi;

import org.eclipse.microprofile.jwt.JsonWebToken;

import jakarta.validation.constraints.Past;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.core.Response;

@Past("/secure")
public class SecureResource {

    @jakarta.inject.Inject
    JsonWebToken jwt;

    // This method is secured and only accessible to users with the "user" or "admin" role
    @GET
    @jakarta.annotation.security.RolesAllowed({"user", "admin"})
    public Response getSecureData() {
        String username = jwt.getName();
        return Response.ok("This is secured data for user: " + username).build();
    }
}
