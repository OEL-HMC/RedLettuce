component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "RedisConnection",
                function(){

                    it(
                        "Build a redis client", 
                        function(){
                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();


                            redisClient.shutdown();  

                        }
                    );

                }
            );

            describe(
                "tests for building configuration for redis connection",
                function(){

                    it(
                        "Real connection on a Redis docker instance",
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            //writeDump( redisClient.getCommands() );

                            redisClient.shutdown();
                        }
                    );

                    

                }
            );

            describe(
                "tests for building configuration for redis connection",
                function(){

                    it(
                        "Make a scan call without any argument",
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.scan().execute( redisClient, '^dcx_*' );
                            //writeDump(res);

                            //writeDump( redisClient.getCommands() );

                            redisClient.shutdown();
                        }
                    );

                    
                    it(
                        "Make a scan call without any argument",
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.scan().execute( redisClient );

                            //writeDump( redisClient.getCommands() );

                            redisClient.shutdown();
                        }
                    );

                    it(
                        "Make a scan call with limit 10",
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var dbsize = new redis.commands.DBSize().execute( redisClient );


                            var res = new redis.commands.scan().execute( redisClient, "*", 10 );  

                            

                            expect( res.len() ).toBe( local.dbsize );

                            //writeDump( redisClient.getCommands() );

                            redisClient.shutdown();
                        }
                    );

                    
                    it(
                        "Make a KEYS call",
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.keys().execute( redisClient, "dcx_import_DCX-TMS*");

                            expect( res.len()  ).toBe( 10 );
                            redisClient.shutdown();
                        }
                    );

                }
            );
            
        };

}