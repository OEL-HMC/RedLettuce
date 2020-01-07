component accessors="false" output="false"{

    public GetSet function init(){

        return this;
    }

    public any function execute(
        required redis.client.RedisClient redisClient,
        required string key,
        required any value
    ){

        writeDump(
            redisClient.getCommands()
        );

        return redisClient.getCommands().getset( arguments.key, arguments.value );

    }

}