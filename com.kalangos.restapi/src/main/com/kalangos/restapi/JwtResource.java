package canivetesuisso.com.kalangos.restapi.com.kalangos.restapi;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.Response;

@jakarta.ws.rs.Path("/jwt")
public class JwtResource {

    @Inject
    JwtGeneratorService jwtGeneratorService;

    @GET
    @Path("/generate")
    public Response generateJwt(@QueryParam("username") String username,
                                @QueryParam("issuer") String issuer) {
        if (username == null || issuer == null) {
            return Response.status(Response.Status.BAD_REQUEST)
                           .entity("Username and issuer are required")
                           .build();
        }

        String jwtToken = jwtGeneratorService.generateJwtToken(username, issuer);
        return Response.ok(jwtToken).build();
    }
}
