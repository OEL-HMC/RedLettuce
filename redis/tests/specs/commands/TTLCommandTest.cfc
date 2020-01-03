component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "TTL COMMAND : Returns the remaining time to live of a key that has a timeout",
                function(){

                    it(
                        "TTL on a non-existing key", 
                        function(){

                            var builder = new redis.RedisClientBuilder();
                            var conf = new redis.config.RedisConnection().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.TTL().execute( redisClient,  "blabla does not exits");

                            expect(res).toBe(-2);

                            redisClient.shutdown();  

                        }
                    );

                    it(
                        "TTL on a existing key with no TTL", 
                        function(){

                            var builder = new redis.RedisClientBuilder();
                            var conf = new redis.config.RedisConnection().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var keys =new redis.commands.scan().execute( redisClient ) 

                            var res = new redis.commands.TTL().execute( redisClient,  keys[1]);

                            expect(res).toBe(-1);

                            redisClient.shutdown();  

                        }
                    );

                }
            );

            

            
            
        };

}