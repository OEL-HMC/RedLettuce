component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "EXISTS COMMAND",
                function(){

                    

                    it(
                        "Send a non-ewisting key and check if it exists", 
                        function(){

                            var builder = new redis.RedisClientBuilder();
                            var conf = new redis.config.RedisConnection().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.Exists().execute( redisClient,  ["blabla does not exits"]);

                            expect(res).toBe(0);

                            redisClient.shutdown();  

                        }
                    );

                    it(
                        "Send a non-existing key and 2 existing keys. result must be 2", 
                        function(){

                            var builder = new redis.RedisClientBuilder();
                            var conf = new redis.config.RedisConnection().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var keys = new redis.commands.Scan().execute( redisClient ); 

                            var res = new redis.commands.Exists().execute( redisClient,  ["blabla does not exits", keys[1], keys[2]]);

                            expect(res).toBe(2);

                            redisClient.shutdown();  

                        }
                    );

                }
            );

            

            
            
        };

}