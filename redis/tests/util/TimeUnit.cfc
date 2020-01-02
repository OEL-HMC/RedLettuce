component extends="testbox.system.BaseSpec"{

		function beforeAll(){
			variables.util = new redis.util.TimeUnit();
		}

        function run(){
        

            describe(
                "Timeunit tests - DAYS",
                function(){

                    

                    it(
                        "Day timeUnit getTimeUnit('day') ", 
                        function(){
                             expect( util.getTimeUnit("day").name() ).toBe("DAYS");
                        }
                    );

					it(
                        "Day timeUnit getTimeUnit('days') ", 
                        function(){
                             expect( util.getTimeUnit("days").name() ).toBe("DAYS");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('d') ", 
                        function(){
                             expect( util.getTimeUnit("d").name() ).toBe("DAYS");
                        }
                    );
                    
                    
                }
            );
            
            describe(
                "Timeunit tests - HOURS",
                function(){

                    

                    it(
                        "Day timeUnit getTimeUnit('hours') ", 
                        function(){
                             expect( util.getTimeUnit("hours").name() ).toBe("HOURS");
                        }
                    );

					it(
                        "Day timeUnit getTimeUnit('hour') ", 
                        function(){
                             expect( util.getTimeUnit("hour").name() ).toBe("HOURS");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('h') ", 
                        function(){
                             expect( util.getTimeUnit("h").name() ).toBe("HOURS");
                        }
                    );
                    
                    
                }
            );
            
              describe(
                "Timeunit tests - MINUTES",
                function(){

                    

                    it(
                        "Day timeUnit getTimeUnit('minutes') ", 
                        function(){
                             expect( util.getTimeUnit("minutes").name() ).toBe("MINUTES");
                        }
                    );

					it(
                        "Day timeUnit getTimeUnit('minute') ", 
                        function(){
                             expect( util.getTimeUnit("minute").name() ).toBe("MINUTES");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('m') ", 
                        function(){
                             expect( util.getTimeUnit("m").name() ).toBe("MINUTES");
                        }
                    );
                    
                    
                }
            );

            
            describe(
                "Timeunit tests - SECONDS",
                function(){

                    

                    it(
                        "Day timeUnit getTimeUnit('seconds') ", 
                        function(){
                             expect( util.getTimeUnit("seconds").name() ).toBe("SECONDS");
                        }
                    );

					it(
                        "Day timeUnit getTimeUnit('second') ", 
                        function(){
                             expect( util.getTimeUnit("second").name() ).toBe("SECONDS");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('m') ", 
                        function(){
                             expect( util.getTimeUnit("s").name() ).toBe("SECONDS");
                        }
                    );
                    
                    
                }
            );
            
            describe(
                "Timeunit tests - MILLISECONDS",
                function(){

                    

                    it(
                        "Day timeUnit getTimeUnit('MILLISECONDS') ", 
                        function(){
                             expect( util.getTimeUnit("MILLISECONDS").name() ).toBe("MILLISECONDS");
                        }
                    );

					it(
                        "Day timeUnit getTimeUnit('MILLISECOND') ", 
                        function(){
                             expect( util.getTimeUnit("MILLISECOND").name() ).toBe("MILLISECONDS");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('ms') ", 
                        function(){
                             expect( util.getTimeUnit("ms").name() ).toBe("MILLISECONDS");
                        }
                    );
                    it(
                        "Day timeUnit getTimeUnit('millis') ", 
                        function(){
                             expect( util.getTimeUnit("millis").name() ).toBe("MILLISECONDS");
                        }
                    );
                    it(
                        "Day timeUnit getTimeUnit('milli') ", 
                        function(){
                             expect( util.getTimeUnit("milli").name() ).toBe("MILLISECONDS");
                        }
                    );
                    
                    
                }
            );
            
            describe(
                "Timeunit tests - MICROSECONDS",
                function(){

                    

                    it(
                        "Day timeUnit getTimeUnit('MICROSECONDS') ", 
                        function(){
                             expect( util.getTimeUnit("MICROSECONDS").name() ).toBe("MICROSECONDS");
                        }
                    );

					it(
                        "Day timeUnit getTimeUnit('MICROSECOND') ", 
                        function(){
                             expect( util.getTimeUnit("MICROSECOND").name() ).toBe("MICROSECONDS");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('us') ", 
                        function(){
                             expect( util.getTimeUnit("us").name() ).toBe("MICROSECONDS");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('micros') ", 
                        function(){
                             expect( util.getTimeUnit("micros").name() ).toBe("MICROSECONDS");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('micro') ", 
                        function(){
                             expect( util.getTimeUnit("micro").name() ).toBe("MICROSECONDS");
                        }
                    );
                    
                    
                    
                    
                }
            
            
                                
                    
                    
            
            );


			describe(
                "Timeunit tests - NANOSECONDS",
                function(){

                    

                    it(
                        "Day timeUnit getTimeUnit('NANOSECONDS') ", 
                        function(){
                             expect( util.getTimeUnit("NANOSECONDS").name() ).toBe("NANOSECONDS");
                        }
                    );

					it(
                        "Day timeUnit getTimeUnit('NANOSECOND') ", 
                        function(){
                             expect( util.getTimeUnit("NANOSECOND").name() ).toBe("NANOSECONDS");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('ns') ", 
                        function(){
                             expect( util.getTimeUnit("ns").name() ).toBe("NANOSECONDS");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('nanos') ", 
                        function(){
                             expect( util.getTimeUnit("nanos").name() ).toBe("NANOSECONDS");
                        }
                    );
                    
                    it(
                        "Day timeUnit getTimeUnit('nano') ", 
                        function(){
                             expect( util.getTimeUnit("nano").name() ).toBe("NANOSECONDS");
                        }
                    );
                    
                    
                    
                    
                }
            
            
                                
                    
                    
            
            );

            
            
        };

}