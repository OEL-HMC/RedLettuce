component{

    public numeric function execute(
        required RedisClient redisClient,
        required string key, 
        required string value
    ){


        return redisClient.getCommands().append(
            arguments.key,
            arguments.value
        );
    }

}