component extends="BaseCommandTest"{


    function beforeAll(){
        super.beforeAll();

        variables.key1 = "mykey";
        variables.key2 = "myotherkey";
        variables.key3 = "myotherKey2";

        var setResult1 = new redis.commands.Set().execute( redisClient, variables.key1, "Hello" );
        var setResult2 = new redis.commands.Set().execute( redisClient, variables.key2, "World" );



    }

    function afterAll(){
        var delResult = new redis.commands.Del().execute( redisClient, variables.key1 );
        var delResult = new redis.commands.Del().execute( redisClient, variables.key2 );
        var delResult = new redis.commands.Del().execute( redisClient, variables.key3 );
        super.afterAll();
    }

    function run(){

        describe(
            "RenameNX from https://redis.io/commands/renamenx",
            function(){
                it(
                    "Returns 0 if trying to rename with a name already existing",
                    function(){
                        var renNX = new redis.commands.RenameNX().execute( redisClient, variables.key1, variables.key2 );
                        expect( renNX ).toBe(0);


                        expect(
                            new redis.commands.get().execute( redisClient, variables.key1 )
                        ).toBe("Hello");
                        expect(
                            new redis.commands.get().execute( redisClient, variables.key2 )
                        ).toBe("World");
                    }
                );

                it(
                    "Returns 1 if trying to rename with a key that DOES NOT exist.",
                    function(){
                        var renNX = new redis.commands.RenameNX().execute( redisClient, variables.key1, variables.key3 );
                        expect( renNX ).toBe(1);

                        expect(
                            new redis.commands.get().execute( redisClient, variables.key3 )
                        ).toBe("Hello");
                        
                        expect(
                            new redis.commands.get().execute( redisClient, variables.key2 )
                        ).toBe("World");
                    }
                );
            }
        );

    }

}