

import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import canivetesuisso.com.kalangos.restapi;

@ApplicationScoped
public class JwtGeneratorService {

    @Inject
    JsonWebToken jwt;

    public String generateJwtToken(String username, String issuer) {
        // Use JsonWebToken to generate JWT token
        return jwt
                .issuer(issuer)
                .subject(username)
                .claim("customClaim", "value")
                .groups("user", "admin")
                .sign();
    }
}
