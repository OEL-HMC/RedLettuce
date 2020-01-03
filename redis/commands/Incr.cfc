component accessors="false" output="false"{

    import "redis.client.RedisClient";

    public numeric function execute(
        required RedisClient redisClient,
        required string key    
    ){
        return redisClient.getCommands().incr( arguments.key );
    }

}