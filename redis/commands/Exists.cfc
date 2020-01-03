component accessors="false" output="false"{

    import "redis.client.RedisClient";

    public numeric function execute(
        required RedisClient redisClient,
        required any matches hint="List of keys or array of keys"
    )
    {

        var existsArguments = ( isSimpleValue( arguments.matches ) ) ? listToArray( arguments.matches ): arguments.matches;

        return redisClient.getCommands().exists( existsArguments );
    }


}