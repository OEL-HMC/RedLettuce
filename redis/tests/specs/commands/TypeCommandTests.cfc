component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "DEL COMMAND",
                function(){

                    it(
                        "Make a TYPE command on a non-existing key : returns 'none'", 
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.Type().execute( redisClient,  "blabla does not exits");

                            expect(res).toBe("none");

                            redisClient.shutdown();  

                        }
                    );



                    it("Make a scan and get the type of the first key", 
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var scanResult = new redis.commands.Scan().execute( redisClient );
                            
                            var res = new redis.commands.Type().execute( redisClient,  scanResult[1] );

                            expect(res).toBe("string");

                            redisClient.shutdown();  

                        }
                    );

                }
            );

            
            
        };

}