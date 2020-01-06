component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "UNLINK COMMAND",
                function(){

                    it(
                        "Try to delete an non-existing key. Must return 0", 
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.Unlink().execute( redisClient,  ["blabla does not exits"]);

                            expect(res).toBe(0);

                            redisClient.shutdown();  

                        }
                    );

                }
            );

            

            
            
        };

}