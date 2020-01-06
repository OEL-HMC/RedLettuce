component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "INCRBY COMMAND",
                function(){

                    it(
                        "DECRBY key 1", 
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.DecrBy().execute( redisClient,  "INCRBY_KEY", 1);

                            expect(res).toBe(-1);

                            var res = new redis.commands.DecrBy().execute( redisClient,  "INCRBY_KEY", 1);

                            expect(res).toBe(-2);

                            var res = new redis.commands.Del().execute( redisClient,  "INCRBY_KEY" );

                            expect( res ).toBe(1);

                            redisClient.shutdown();  

                        }
                    );

                    it(
                        "DECRBY key 1", 
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.DecrBy().execute( redisClient,  "INCRBY_KEY", 2);

                            expect(res).toBe(-2);

                            var res = new redis.commands.DecrBy().execute( redisClient,  "INCRBY_KEY", 2);

                            expect(res).toBe(-4);

                            var res = new redis.commands.Del().execute( redisClient,  "INCRBY_KEY" );

                            expect( res ).toBe(1);

                            redisClient.shutdown();  

                        }
                    );

                }
            );

            

            
            
        };

}