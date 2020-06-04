module SteamOIDC
    class Worker
        #
        # * +provider_uri+ - For OpenAthens this will be <code>https://connect.openathens.net</code>
        # * +client_id+ - Obtain from the OpenAthens publisher dashboard
        # * +secret+ - Obtain from the OpenAthens publisher dashboard
        # * +redirect_uri+ - This is where the user will be returned to after successful authentication.
        #   You will need to implement this on your server (e.g <code>https://oidc-rp.example/redirect</code>)
        #
        def initialize(provider_uri, client_id, secret, redirect_uri)
            @provider_uri = provider_uri
            @client_id = client_id
            @secret = secret
            @redirect_uri = redirect_uri
        end
        #
        # * +nonce+ - Unique value associated with the request. Same value needs to be passed to the #redirect method (store in users session)
        # Returns the authentication URL. Redirect users to authenticate.
        #
        def auth_uri(nonce)
            authz_url = init_client.authorization_uri(
                scope: [:profile, :email],
                state: nonce,
                nonce: nonce
            )
        end
        #
        # * +code+ - The code returned from the OP after successful user authentication.

        # This will be available via the <code>querystring</code> when the user is return to <code>redirect_uri</code>.
        # * +nonce+ - The same value use to call #auth_uri (e.g read from the user session - <code>session.delete(:nonce)</code>)
        #
        # Returns the userinfo <code>OpenIDConnect::ResponseObject::UserInfo</code>.
        # Use <code>userinfo.raw_attributes</code> to access all the OpenId claims returned from the OpenAthens connect service.
        #
        def redirect (code, nonce)
            client = init_client
            #What we are expecting.
            expected = {:client_id => @client_id, :issuer => discover.issuer, :nonce => nonce}
            #Get code from query string.
            client.authorization_code = code
            access_token = client.access_token!
            #Validate the access token.
            id_token = OpenIDConnect::ResponseObject::IdToken.decode access_token.id_token, discover.jwks
            id_token.verify! expected
            #Read userinfo
            user_info = access_token.userinfo!
        end


        private
        def init_client
            @client ||= OpenIDConnect::Client.new(
                identifier:@client_id,
                secret: @secret,
                redirect_uri: @redirect_uri,
                authorization_endpoint: discover.authorization_endpoint,
                token_endpoint: discover.token_endpoint,
                userinfo_endpoint: discover.userinfo_endpoint
            )
        end

        def discover
            @disco ||= OpenIDConnect::Discovery::Provider::Config.discover! @provider_uri
        end

    end
end
