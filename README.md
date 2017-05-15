# Issue Suppress Jruby Error input plugin for Embulk

sample about: Couldn't get causes if the errors inherits Embulk::DataError or Embulk::ConfigError


## How to run

```
$ git clone git@github.com:civitaspo/embulk-input-issue_suppress_jruby_error.git
$ cd embulk-input-issue_suppress_jruby_error
$ embulk run example/config.yml -Ilib
2017-05-15 16:15:24.956 +0900: Embulk v0.8.18
2017-05-15 16:15:26.148 +0900 [INFO] (0001:transaction): Loaded plugin embulk/input/issue_suppress_jruby_error from a load path
2017-05-15 16:15:26.176 +0900 [INFO] (0001:transaction): Using local thread executor with max_threads=16 / output tasks 8 = input tasks 1 * 8
2017-05-15 16:15:26.189 +0900 [INFO] (0001:transaction): {done:  0 / 1, running: 0}
example-value,1,0.1
example-value,2,0.2
2017-05-15 16:15:26.267 +0900 [ERROR] (0016:task-0000): e: {class:Embulk::Input::IssueSuppressJrubyError::Error,msg:err}
2017-05-15 16:15:26.267 +0900 [ERROR] (0016:task-0000): e.cause: {class:NilClass,msg:}
2017-05-15 16:15:26.329 +0900 [INFO] (0001:transaction): {done:  1 / 1, running: 0}
org.embulk.exec.PartialExecutionException: org.jruby.exceptions.RaiseException: (NoMethodError) undefined method `cause' for nil:NilClass
        at org.embulk.exec.BulkLoader$LoaderState.buildPartialExecuteException(org/embulk/exec/BulkLoader.java:373)
        at org.embulk.exec.BulkLoader.doRun(org/embulk/exec/BulkLoader.java:591)
        at org.embulk.exec.BulkLoader.access$000(org/embulk/exec/BulkLoader.java:33)
        at org.embulk.exec.BulkLoader$1.run(org/embulk/exec/BulkLoader.java:389)
        at org.embulk.exec.BulkLoader$1.run(org/embulk/exec/BulkLoader.java:385)
        at org.embulk.spi.Exec.doWith(org/embulk/spi/Exec.java:25)
        at org.embulk.exec.BulkLoader.run(org/embulk/exec/BulkLoader.java:385)
        at org.embulk.EmbulkEmbed.run(org/embulk/EmbulkEmbed.java:180)
        at java.lang.reflect.Method.invoke(java/lang/reflect/Method.java:498)
        at org.jruby.javasupport.JavaMethod.invokeDirectWithExceptionHandling(org/jruby/javasupport/JavaMethod.java:453)
        at org.jruby.javasupport.JavaMethod.invokeDirect(org/jruby/javasupport/JavaMethod.java:314)
        at RUBY.run(/Users/takahiro.nakayama/bin/embulk!/embulk/runner.rb:84)
        at RUBY.run(/Users/takahiro.nakayama/bin/embulk!/embulk/command/embulk_run.rb:307)
        at RUBY.<main>(/Users/takahiro.nakayama/bin/embulk!/embulk/command/embulk_main.rb:2)
        at org.jruby.Ruby.runInterpreter(org/jruby/Ruby.java:850)
        at org.jruby.Ruby.loadFile(org/jruby/Ruby.java:2976)
        at org.jruby.RubyKernel.requireCommon(org/jruby/RubyKernel.java:963)
        at org.jruby.RubyKernel.require(org/jruby/RubyKernel.java:956)
        at org.jruby.RubyKernel$INVOKER$s$1$0$require19.call(org/jruby/RubyKernel$INVOKER$s$1$0$require19.gen)
        at RUBY.(root)(uri:classloader:/META-INF/jruby.home/lib/ruby/stdlib/rubygems/core_ext/kernel_require.rb:1)
        at Users.takahiro_dot_nakayama.bin.embulk.embulk.command.embulk_bundle.invokeOther66:require(Users/takahiro_dot_nakayama/bin/embulk/embulk
/command/file:/Users/takahiro.nakayama/bin/embulk!/embulk/command/embulk_bundle.rb:51)
        at Users.takahiro_dot_nakayama.bin.embulk.embulk.command.embulk_bundle.<main>(file:/Users/takahiro.nakayama/bin/embulk!/embulk/command/emb
ulk_bundle.rb:51)
        at java.lang.invoke.MethodHandle.invokeWithArguments(java/lang/invoke/MethodHandle.java:627)
        at org.jruby.Ruby.runScript(org/jruby/Ruby.java:834)
        at org.jruby.Ruby.runNormally(org/jruby/Ruby.java:749)
        at org.jruby.Ruby.runNormally(org/jruby/Ruby.java:767)
        at org.jruby.Ruby.runFromMain(org/jruby/Ruby.java:580)
        at org.jruby.Main.doRunFromMain(org/jruby/Main.java:425)
        at org.jruby.Main.internalRun(org/jruby/Main.java:313)
        at org.jruby.Main.run(org/jruby/Main.java:242)
        at org.jruby.Main.main(org/jruby/Main.java:204)
        at org.embulk.cli.Main.main(org/embulk/cli/Main.java:23)
Caused by: org.jruby.exceptions.RaiseException: (NoMethodError) undefined method `cause' for nil:NilClass
        at RUBY.run(/Users/takahiro.nakayama/embulk-input-issue_suppress_jruby_error/lib/embulk/input/issue_suppress_jruby_error.rb:58)
        at RUBY.run(/Users/takahiro.nakayama/bin/embulk!/embulk/input_plugin.rb:100)

Error: org.jruby.exceptions.RaiseException: (NoMethodError) undefined method `cause' for nil:NilClass
```

