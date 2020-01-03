component{

    public string function execute(
        required RedisClient redisClient,
        required string key, 
        required string newKey
    ){

        var result = "ERR";

        try{
            result = redisClient.getCommands().rename( arguments.key, arguments.newKey );
        }catch( any e ){}
        

        return result;
    }

}