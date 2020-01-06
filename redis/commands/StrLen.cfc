component output="false" accessors="false"{

    public StrLen function init(){

        return this;
    }

    public numeric function execute(
        required redisClient,
        required string key
    ){

        return redisClient.getCommands().strlen( arguments.key );

    }
}