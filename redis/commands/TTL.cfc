component accessors="true" output="false" {


    import "redis.client.RedisClient";

    public numeric function execute(
        required redisClient,
        required string key
    )
    hint="Returns the time to live in ms for an entry or -2 if it does not exist or -1 if it has no TTL"
    {

        return redisClient.getCommands().ttl( arguments.key );
    }

}