component accessors="false" output="false"{

    import "redis.client.RedisClient";

    public numeric function execute(
        required RedisClient redisClient,
        required string key,
        required numeric value
    ){
        return redisClient.getCommands().incrBy( arguments.key, javacast("int", arguments.value) );
    }

}