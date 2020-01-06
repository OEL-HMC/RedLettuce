component{

    import "redis.client.RedisClient";

    public any function execute(
        required RedisClient redisClient,
        required string key
    ){

        try{

          var strValue = redisClient.getCommands().get( arguments.key );
          
        }catch( any e ){
            return javacast( "null", 0 );
        }
        if( isNull( strValue )   ){
            return javacast( "null", 0 );
        }
        
        return strValue;
    }

}