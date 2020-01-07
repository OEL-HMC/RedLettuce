component output="false" accessors="false"{

    public RenameNX function init(){

        return this;
    }

    public numeric function execute(
        required redis.client.RedisClient redisClient,
        required string key,
        required string newKey
    ){

        return redisClient.getCommands().renameNX( arguments.key, arguments.newKey );

    }
}