component extends="BaseCommandTest"{


    function beforeAll(){
        super.beforeAll();

        var res = new redis.commands.Set().execute( redisClient, "mykey", "Hello" );

    }

    function afterAll(){
        var res = new redis.commands.Del().execute( redisClient, "mykey" );
        super.afterAll();
    }

    function run(){

        describe(
            "nnnn",
            function(){
                it("XXX", 
                    function(){
                        var res = new redis.commands.Get().execute(redisClient, "mykey" );
                        expect(res).toBe( "Hello" );

                        var res = new redis.commands.GetSet().execute(redisClient, "mykey", "World" );
                        expect(res).toBe( "Hello" );

                        var res = new redis.commands.GetSet().execute(redisClient, "mykey", "World" );
                        expect(res).toBe( "World" );

                        var res = new redis.commands.Get().execute(redisClient, "mykey" );
                        expect(res).toBe( "World" );
                    }
                );
            }
        );

    }


}