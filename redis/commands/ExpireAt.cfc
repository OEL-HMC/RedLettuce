component{

    import "redis.client.RedisClient";

    //DateDiff("s", CreateDate(1970,1,1), CreateODBCDateTime(Now()))
    public numeric function execute(
        required RedisClient redisClient,
        required string key,
        required any unixTimeStamp
    ){

        if( isDate( arguments.unixTimeStamp ) ){

            var timestamp = dateDiff( "s", CreateDate(1970,1,1), arguments.unixTimeStamp );

            return redisClient.getCommands().expireAt( arguments.key, javacast("long", timestamp ) );    
        }

        return redisClient.getCommands().expireAt( 
            arguments.key, 
            javacast("long", arguments.unixTimeStamp) 
        );
    }

    

}