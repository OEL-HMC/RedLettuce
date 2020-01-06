component accessors="false" output="false" 
{

    public ConnectionConfigBuilder function init(){

        return this;
    }

    private BaseConnectionConfig function setConnectionDetails( 
        required BaseConnectionConfig config,
        required struct data
    ){

        var theConf = arguments.config;

        arguments.data.each(
            function( string k, any val, struct original){

                switch( arguments.k ){

                    case "name":
                        theConf.name( arguments.val );
                    break;

                    case "masterId":
                    case "master":
                        theConf.masterId( arguments.val[ arguments.k ] );
                    break;

                    case "database":
                    case "db":
                        theConf.database( arguments.val );
                    break;

                    case "timeout":
                        arguments.val.timeout.each(
                            function( tk, tv ){
                                switch( tk ){
                                    case 'value':
                                        theConf.timeout( tv );
                                    break;
                                    case 'unit':
                                        theConf.timeoutUnit( tv );
                                    break;
                                }
                            }
                        );
                    break;

                    case "host":
                    case "hosts":
                            var theHosts = ( isArray( val ) ) ? val : [val];
                            theHosts.each(
                                function( curHOst ){
                                    theConf.host( curHOst );
                                }
                            );
                    break;
                }
            }
        );

        return theConf;
        


    }

    public BaseConnectionConfig function fromStruct( required struct config ){



        switch(
            arguments.config.type ?: ""
        ){

            case "redis":

                var cConf = new RedisConnectionConfig();

            break;

            case "ssl":

                var cConf = new SSLConnectionConfig();


            break;

            case "sentinel":
                var cConf  = new SentinelConnectionConfig();

            break;

            case "socket":

            break;

            default:
                throw(
                    type="REDIS.CONNECTION_TYPE_UNKNOWN",
                    message="Unknown type of connection to create."
                );
            break;

        }

        setConnectionDetails(
            cConf, arguments.config
        );
        return cConf;
    }

}