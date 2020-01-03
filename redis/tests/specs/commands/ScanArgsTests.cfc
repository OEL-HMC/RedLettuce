component extends="testbox.system.BaseSpec"{

    public function run(){

        describe(
            "Tests for ScanArgs builder",
            function(){
                it(
                    "empty scan args : new redis.commands.ScanArgs().build()",
                    function(){
                        var emptyScanArgs = new redis.commands.ScanArgs().build();
                        expect( isObject( new redis.commands.ScanArgs().build() ) ).toBeTrue();
                    }
                );
                it(
                    "limited scan args : new redis.commands.ScanArgs().build({'limit':10})",
                    function(){
                        var scanArgs10 = new redis.commands.ScanArgs().build({'limit':10});
                    }
                );

                it(
                    "limited scan args : new redis.commands.ScanArgs().build({match: 'cf_*','limit':10})",
                    function(){
                        var scanArgs10 = new redis.commands.ScanArgs().build({match: 'cf_*','limit':10});
                        //writeDump(scanArgs10);
                    }
                );
            }
        );

    }

} 