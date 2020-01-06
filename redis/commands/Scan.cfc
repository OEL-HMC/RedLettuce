component accessors="false" output="false" {

    import "redis.client.RedisClient"

    private struct function getScanArgsArguments( struct args = {} ){
        var sanitized = { "args": {} };
        for( var k in "limit,match" ){
            if( structKeyExists( arguments.args, local.k ) ){
                sanitized.args.put( local.k, arguments.args[local.k] );
            }
        } 
        
        return sanitized;
    }

    public array function execute( 
        required RedisClient redisClient,
        string match hint="Key must match this",
        numeric limit hint="ScanArgs limit : long"
    ){

        //writeDump( redisClient.getCommands() );

        var sanitized       = getScanArgsArguments( arguments );
        var args            = new ScanArgs().build( argumentCollection = sanitized );
        var iterator        = createObject("java", "io.lettuce.core.ScanIterator").scan( redisClient.getCommands(), args );
        var keys            = [];

        while( iterator.hasNext() ){
            var key = iterator.next();
            keys.append( key );
        }

        

        return keys;

    }

}