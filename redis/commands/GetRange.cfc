component output="false" accessors="false"{

    public GetRange function init(){

        return this;
    }

    public string function execute(
        required redis.client.RedisClient redisClient,
        required string key,
        required numeric start,
        required numeric end
    ){

        //writeDump( redisClient.getCommands() );

        return redisClient.getCommands().getrange( 
            arguments.key,
            javacast('long', arguments.start),
            javacast('long', arguments.end)
        );
    }

}