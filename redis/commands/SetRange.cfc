component{

    public SetRange function init(){

        return this;
    }

    

    public any function execute(
        required RedisClient redisClient, 
        required string key, 
        required numeric offset,
        required string newValue
    ){

        
    

        return redisClient.getCommands().setrange(
            arguments.key,
            javacast("long", arguments.offset),
            arguments.newValue
        );

    }

}