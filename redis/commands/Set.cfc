component{

    import "redis.client.RedisClient";

    public any function execute(
        required RedisClient redisClient,
        required string key,
        required string value,
        string setRule hint="if nx : set only if key does not exist, if xx : only if key exists",
        numeric timeout,
        string timeoutUnit
    ){

        var setArgs = 0;

        if( structKeyExists( arguments, "setRule" ) ){

            switch( arguments.setRule ){

                case "nx":
                    setArgs = createObject( "java", "io.lettuce.core.SetArgs" ).nx();
                break;

                case "xx":
                    setArgs = createObject( "java", "io.lettuce.core.SetArgs" ).xx();
                break;

                default:
                    throw( "Wrong value for existingRule argument. Only nx or xx value are accepted" );
                break;
            }

        }

        if( structKeyExists( arguments, "timeout" ) && structKeyExists( arguments, "timeoutUnit" ) ){
            
            switch( arguments.timeoutUnit ){

                case "ms":
                    if( isSimpleValue( setArgs ) ){
                        setArgs = createObject( "java", "io.lettuce.core.SetArgs" ).px( 
                            javacast( "long", arguments.timeout ) 
                        );
                    }else{
                        setArgs.px( javacast("long", arguments.timeout) );
                    }
                break;

                case "s":
                    if( isSimpleValue( setArgs ) ){
                        setArgs = createObject( "java", "io.lettuce.core.SetArgs" ).ex( 
                            javacast( "long", arguments.timeout ) 
                        );
                    }else{
                        setArgs.ex( javacast("long", arguments.timeout) );
                    }
                break;
                default:
                    throw( "wrong timeout unit for set args" );
                break;

            }
        }

        if( isSimpleValue( setArgs ) ){
            return redisClient.getCommands().set( arguments.key, arguments.value );
        }else{
            return redisClient.getCommands().set( arguments.key, arguments.value, setArgs );
        }

    }

}